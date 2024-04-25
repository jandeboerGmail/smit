import os,time,shutil,re
from django.utils import timezone
from datetime import datetime
from django.core.mail import send_mail, EmailMessage
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User , Group

from camera.models import Adress, Account, Bedrijf, Parameter, Camera, Locatie, Video ,ServiceOrder, Log, Parameter, Gebied

# generic functions
def validDate(dateIn):
    #  CCYYMMDDHHmmss
    date_pattern = "^[1-9][0-9][0-9][0-9][0-2][0-9][0-3][0-9][0-2][0-9][0-5][0-9][0-5][0-9]$"
    return  re.match(date_pattern, dateIn) # Returns Match object

# Video security
def isFromBedrijf(aUser):
    # print ('aUserid:',aUser)
    results = Group.objects.filter(user = aUser)
    if results:
        result  = results[0]
    else:
        result= 'admin'
    return result

def videoIsAllowed(request,aVideo):
    #print('videoIsAllowed')
    currentUser = request.user
    aUser =  User.objects.get(id=currentUser.id)

    if aUser.is_superuser:
        return True
    else:
        result = False
        aAccount = Account.objects.get(user_id=currentUser.id)
        aCamera = Camera.objects.filter(naam=aVideo.camera)[0]
        aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
        #print ('Locatie :',aVideo.naam, aLocatie.gebied)

        for gebied in aAccount.gebied.all():
            #print ("Gebieden van Account: ",gebied)
            if not result and aLocatie.gebied == gebied:
                result = True
                # print ('Allowed :',aAccount.user, aVideo.naam, aLocatie.gebied)
        return result
    
  
   
def checkVideos (aUserId,bedrijf):  
    aUser =  User.objects.get(id=aUserId)   
    #print ("User = ",aUser,bedrijf )  
    
    if bedrijf == "admin" :
       aVideoList = Video.objects.order_by('-datum_updated','ordernr','naam','camera')
    else:
      aVideoList = Video.objects.filter(camera__locatie__bedrijf__naam__icontains=bedrijf).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
    
    if aUser.is_superuser:
        return aVideoList
    else:
        validatedVideos = []
        try:
            aAccount = Account.objects.get(user_id=aUserId)
        except:
            aAccount = None
      
        if aAccount:
            for aVideo in aVideoList:
                aCamera = Camera.objects.filter(naam=aVideo.camera)[0]
                aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
                #print ('Locatie :',aVideo.naam, aLocatie.gebied)

                for gebied in aAccount.gebied.all():
                    #print ("Gebieden van Account: ",gebied)
                    if aLocatie.gebied == gebied:
                        validatedVideos.append(aVideo)
                     #print ('Allowed :',aAccount.user, aVideo.naam, aLocatie.gebied)
        return validatedVideos
       
def checkVideosNaam(aUserId,bedrijf,naam):   
    aUser =  User.objects.get(id=aUserId)     
    if bedrijf == "admin" :
        aVideoList = Video.objects.filter(naam__icontains=naam).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
    else:
        aVideoList = Video.objects.filter(camera__locatie__bedrijf__naam__icontains=bedrijf,naam__icontains=naam).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
    
    if aUser.is_superuser:
        return aVideoList
    else:
        validatedVideos = []
        aAccount = Account.objects.get(user_id=aUserId)
        for aVideo in aVideoList:
            aCamera = Camera.objects.filter(naam=aVideo.camera)[0]
            aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
            #print ('Locatie :',aVideo.naam, aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                if aLocatie.gebied == gebied:
                    validatedVideos.append(aVideo)
                    #print ('Allowed :',aAccount.user, aVideo.naam, aLocatie.gebied)
        return validatedVideos

def checkVideosLocatie(aUserId,bedrijf,locatie):   
    aUser =  User.objects.get(id=aUserId)   

    #qset = (Q(camera__locatie__naam__icontains=locatie))    
    #video_list = Video.objects.filter(qset).select_related('camera').distinct().order_by('naam')  
    
    if bedrijf == "admin" :
        aVideoList = Video.objects.filter(camera__locatie__naam__icontains=locatie).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
    else:
        aVideoList = Video.objects.filter(camera__locatie__bedrijf__naam__icontains=bedrijf,camera__locatie__naam__icontains=locatie).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
    
    if aUser.is_superuser:
        return aVideoList
    else:
        validatedVideos = []
        aAccount = Account.objects.get(user_id=aUserId)
        for aVideo in aVideoList:
            aCamera = Camera.objects.filter(naam=aVideo.camera)[0]
            aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
            #print ('Locatie :',aVideo.naam, aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                if aLocatie.gebied == gebied:
                    validatedVideos.append(aVideo)
                    #print ('Allowed :',aAccount.user, aVideo.naam, aLocatie.gebied)
        return validatedVideos
           
# Cameras security
def checkCameras(aUserId,bedrijf):   
    aUser =  User.objects.get(id=aUserId)     
    if bedrijf == "admin":
        aCameraList = Camera.objects.order_by('locatie','naam')
    else:
        aCameraList = Camera.objects.filter(locatie__bedrijf__naam__icontains=bedrijf).order_by('locatie','naam')

    if aUser.is_superuser:
        print
        return aCameraList
    else:
        validatedCameras = []
        aAccount = Account.objects.get(user_id=aUserId)
        for aCamera in aCameraList:
            aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
            #print ('Locatie :',aCamera.naam, aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                if aLocatie.gebied == gebied:
                    validatedCameras.append(aCamera)
                    #print ('Allowed :',aAccount.user, aCamera.naam, aLocatie.gebied)
        return validatedCameras
    
def checkCamerasNaam(aUserId,bedrijf,naam):    
    aUser =  User.objects.get(id=aUserId) 
      
    if bedrijf == "admin" :
        aCameraList = Camera.objects.filter(naam__icontains=naam).order_by('locatie','naam')
    else:
        #aList = Camera.objects.filter(locatie__bedrijf__naam__icontains=bedrijf,naam__icontains=naam).select_related("locatie").order_by('locatie','naam')
        aCameraList = Camera.objects.filter(locatie__bedrijf__naam__icontains=bedrijf,naam__icontains=naam).order_by('locatie','naam')
       
    if aUser.is_superuser:
        return aCameraList
    else:
        validatedCameras = []
        aAccount = Account.objects.get(user_id=aUserId)
        for aCamera in aCameraList:
            aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
            #print ('Locatie :',aCamera.naam, aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                if aLocatie.gebied == gebied:
                    validatedCameras.append(aCamera)
                    # print ('Allowed :',aAccount.user, aCamera.naam, aLocatie.gebied)
        return validatedCameras
    
def checkCamerasLocatie(aUserId,bedrijf,locatie):   
    aUser =  User.objects.get(id=aUserId)   
        
    if bedrijf == "admin":
        aCameraList = Camera.objects.filter(locatie__naam__icontains=locatie).select_related("locatie").order_by('locatie','naam')
    else:
        aCameraList = Camera.objects.filter(locatie__bedrijf__naam__icontains=bedrijf,locatie__naam__icontains=locatie).select_related("locatie").order_by('locatie','naam')
        
    if aUser.is_superuser:
        return aCameraList
    else:
        validatedCameras = []
        aAccount = Account.objects.get(user_id=aUserId)
        for aCamera in aCameraList:
            aLocatie = Locatie.objects.filter(naam=aCamera.locatie)[0]
            #print ('Locatie :',aCamera.naam, aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                if aLocatie.gebied == gebied:
                    validatedCameras.append(aCamera)
                    #print ('Allowed :',aAccount.user, aCamera.naam, aLocatie.gebied)
        return validatedCameras
    
# Order Security
def listOwnOrders(aUserId,bedrijf):   
    aUser =  User.objects.get(id=aUserId)     
    if bedrijf == "admin":
        anOrderList = ServiceOrder.objects.order_by('ordernr','contact')
    else:
         #aList = ServiceOrder.objects.filter(bedrijf__naam__icontains=bedrijf).select_related("bedrijf").order_by('ordernr','contact')
         #anOrderList = ServiceOrder.objects.filter(locatie__bedrijf__naam__icontains=bedrijf).order_by('locatie','naam')
         anOrderList = ServiceOrder.objects.filter(bedrijf__naam__icontains=bedrijf).select_related("bedrijf").order_by('ordernr','contact')

    if aUser.is_superuser:
        return anOrderList
    else:
        validatedOrders = []
        aAccount = Account.objects.get(user_id=aUserId)
        for anOrder in anOrderList:
            #print ("Order Accounts: ",anOrder.contact,aAccount.user)
            if anOrder.contact == aAccount.user:
                    validatedOrders.append(anOrder)
                    #print ("Alloeed Order Accounts: ",anOrder.contact,aAccount.user)
        return validatedOrders
    
def checkOrdersNumber(aUserId,bedrijf,number):   
    aUser =  User.objects.get(id=aUserId)     
    if bedrijf == "admin":
        anOrderList = ServiceOrder.objects.filter(ordernr__icontains=number).order_by('ordernr','contact')
    else:
         #aList = ServiceOrder.objects.filter(bedrijf__naam__icontains=bedrijf,ordernr__icontains=order).select_related("bedrijf").order_by('ordernr','contact')
         anOrderList = ServiceOrder.objects.filter(bedrijf__naam__icontains=bedrijf,ordernr__icontains=number).select_related("bedrijf").order_by('ordernr','contact')

    if aUser.is_superuser:
        return anOrderList
    else:
        validatedOrders = []
        aAccount = Account.objects.get(user_id=aUserId)
        for anOrder in anOrderList:
            aLocatie = Locatie.objects.filter(naam=anOrder.locatie)[0]
            #print ('Locatie :',aCamera.naam, aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                if aLocatie.gebied == gebied or anOrder.contact == aAccount.user:
                    validatedOrders.append(anOrder)
                    #print ('Allowed :',aAccount.user, anOrder.ordernr, aLocatie.gebied)
        return validatedOrders
    
def checkOrders(aUserId,bedrijf):   
    aUser =  User.objects.get(id=aUserId)
  
    if bedrijf == "admin":
        anOrderList = ServiceOrder.objects.order_by('ordernr','contact')
    else:
        anOrderList = ServiceOrder.objects.filter(bedrijf__naam__icontains=bedrijf).select_related("bedrijf").order_by('ordernr','contact')
        #anOrderList = ServiceOrder.objects.filter(bedrijf__naam__icontains=bedrijf,contact__username__icontains=aUser).select_related("bedrijf").order_by('ordernr','contact')
 
    if aUser.is_superuser:
        return anOrderList
    else:
        validatedOrders = []
        aAccount = Account.objects.get(user_id=aUserId)
        for anOrder in anOrderList:
            aLocatie = Locatie.objects.filter(naam=anOrder.locatie)[0]
            #print ('Locatie :',anOrder.ordernr,aLocatie.gebied)

            for gebied in aAccount.gebied.all():
                #print ("Gebieden van Account: ",gebied)
                #if aLocatie.gebied == gebied or anOrder.contact == aAccount.user:
                if aLocatie.gebied == gebied:
                
                    validatedOrders.append(anOrder)
                    #print ('Allowed :',aAccount.user, anOrder.ordernr, aLocatie.gebied)
        return validatedOrders

#  Generic functions
def addLogEntry(orderNr,message):
    aLog = Log()
    aLog.ordernr = orderNr
    aLog.message = message
    aLog.save()
    return

def removeFile(fileName):
   if os.path.exists(fileName):
        os.remove(fileName)
        print('Removed File :',fileName)

def moveFileToDone(fileName,request):
    destFileName = fileName.replace("2Convert", "2_Convert")
    destDir = substring_before(destFileName, "2_Convert") + "2_Convert/"

    # Check if 2_Convert directory exists
    #print('destDir :',destDir)
    if not os.path.isdir(destDir):
        os.mkdir(destDir)

    # check / create request/Order directory
    reqDir = destDir + request + "/"
    #print('reqDir :', reqDir)
    if not os.path.isdir(reqDir):
         os.mkdir(reqDir)
    
    #print('Move the File :',fileName,destFileName)
    shutil.move(fileName,destFileName)

def size_changed(fileName,sec):
        b_size = os.path.getsize(fileName)
        time.sleep(sec)
        e_size = os.path.getsize(fileName)
        #print('Sizes :',b_size, e_size)
        return b_size == e_size

def substring_after(s, delim):
        return s.partition(delim)[2]

def substring_before(s, delim):
        return s.split(delim)[0]

def convertFileName(inName):
    outName =  inName.replace(" ", "\\ ")
    outName = outName.replace("(", "\\(")
    outName=  outName.replace(")", "\\)")
    outName=  outName.replace("$", "\\$")
    
    return(outName) 

def getFileSize(fileName):
    file_stats = os.stat(fileName)
    fileSize = file_stats.st_size / (1024 * 1024)
    fSize = "%.0f" % fileSize 
    return (fSize)

#----------------- mail stuff -------------------------
def valid_email_address(email_address):
    try:
        validate_email(email_address)
        valid_email = True
    except ValidationError as e:
        valid_email = False
    return valid_email 

def SendMail(subject,message,recipentList):
    emailcheckedRecepentList = []
    orderNr = " "
    for emailAdress in recipentList:
        #print ("email_adress :",emailAdress)
        
        if valid_email_address(emailAdress):
            emailcheckedRecepentList.append(emailAdress)       
            errorMessage = 'INFO : Mail send to: '  + emailAdress
            addLogEntry(orderNr,errorMessage) 
        else:
            errorMessage = 'INFO : Wrong email Adress Specified: '  + emailAdress
            addLogEntry(orderNr,errorMessage) 

    #print ("emailcheckedRecepentList :",emailcheckedRecepentList)    
    #chatgpt
    email = EmailMessage(
        subject, message, 
        'sgportal@smitelektrotechniek.nl', 
        emailcheckedRecepentList, 
        reply_to=['sgportal@smitelektrotechniek.uyhnl'], 
                #headers={'Message-ID': 'foo'},
    )
    email.send()
    return

def mailMigrationReady(sender,fileName):
        now = datetime.now()
        dtString = now.strftime("%d/%m/%Y %H:%M:%S")
        subject = 'Migratie ready ->' +  substring_after(fileName,"Migrated/") 
        message = "Migratie ready -> "  + fileName +' @ '+ dtString
        print ('Message : ',message)
        sender = [sender]
        SendMail(subject,message,sender)

# Parameter functions
def getVideoLocation():
    aParameter =  Parameter.objects.get(id=1)
    ''' testcode
    if validDate("20190702174346"):
        Test = datetime.strptime('20190702174346','%Y%m%d%H%M%S')
        print("valid")
    else:
        print("INVALID")
    if validDate("2019070217434"):
        print("valid")
    else:
        print("INVALID")
    '''
    return str(aParameter.videoPath)

def getOrder():
    aParameter =  Parameter.objects.get(id=1)
    return aParameter.conversion_order
    #return 'test'

def getMaximumConvert():
    aParameter =  Parameter.objects.get(id=1)
    return aParameter.maximum_convert

def getRunningStatus():
    aParameter =  Parameter.objects.get(id=1)
    return aParameter.conversion_running

def setRunningStatus(status):
    aParameter = Parameter.objects.get(id=1)
    aParameter.conversion_running = status
    aParameter.datum_updated = timezone.now()
    aParameter.save()
    #print("Running status: ",status)
    return

# Add video Content 
# Adress 
def addAdress(orderNr,naam):
    #print("add Adress: ",naam)
    aAdressen = Adress.objects.filter(naam=naam)
    if not aAdressen and naam:
        aAdress = Adress()
        aAdress.naam = naam
        aAdress.save ()
    
        message = "WARNING: Default values added for adress: "  + naam 
        addLogEntry(orderNr,message)
    else:
        aAdress = aAdressen[0]
    return aAdress

#Bedrijf
def addBedrijf(orderNr,naam):
    aAdress = addAdress(orderNr,naam)

    aBedrijven = Bedrijf.objects.filter(naam=naam)
    if not aBedrijven and naam:
        aBedrijf = Bedrijf()
        aBedrijf.naam = naam
        aBedrijf.adres = aAdress
        aBedrijf.save()

        message = "WARNING: Default values added for bedrijf: "  + naam 
        addLogEntry(orderNr,message)
    else:
        aBedrijf = aBedrijven[0]
    return aBedrijf   

def addUser(orderNr,naam):

    aGebied = Gebied.objects.get(id=1) # default rights (Noord)

    aUser = User.objects.filter(username=naam)
    if not aUser and naam:
        aUser = User()
        aUser.username = naam
        aUser.first_name = naam
        aUser.last_name = naam
        aUser.is_superuser = True
        #aUser.gebied = aGebied
        aUser.save()

        message = "WARNING: Default values added for user: "  + naam 
        addLogEntry(orderNr,message)
    else:
        aUser =  aUser[0]
    return aUser

#Gebied
def addGebied(orderNr,bedrijfNaam):

    print("addGebied: ",orderNr,bedrijfNaam)
    aBedrijf = addBedrijf(orderNr,bedrijfNaam)

    aGebiedNr = 0 # Not yet known. Set Manually

    aGebieden = Gebied.objects.filter(bedrijf__naam=bedrijfNaam,gebiedNr=aGebiedNr)
    if not aGebieden and bedrijfNaam:
        print ('Add gebied: ',orderNr,'-',bedrijfNaam)
        aGebied = Gebied()
        aGebied.gebiedNr = 0
        aGebied.naam = "onbekend"
        aGebied.bedrijf = aBedrijf
        aGebied.save ()
    
        message = "WARNING: Default values added for gebied: "  + aGebied.naam + " Bedrijf: " + bedrijfNaam
        addLogEntry(orderNr,message)
    else:
        aGebied = aGebieden[0]
    return aGebied

#Locatie
def addLocatie(orderNr,locatieNaam,bedrijfNaam,adressNaam,gebruikerNaam):

    print('Add Locatie: ',orderNr,'-',locatieNaam,'-',bedrijfNaam,'-',adressNaam,'-',gebruikerNaam)
    aBedrijf   = addBedrijf(orderNr,bedrijfNaam)
    aUser      = addUser(orderNr,gebruikerNaam)
    aAdress    = addAdress(orderNr,adressNaam)
    aGebied    = addGebied(orderNr,bedrijfNaam)

    #print ("addLocatie: ", locatieNaam, "-",aAdress.naam,"-",aBedrijf.naam, "-",aUser.username)
    #print ("User: ",aUser.username,"-", aUser.first_name)
    #aLocatie   = Locatie.objects.filter(naam=locatieNaam).select_related('bedrijf')[0]
    #aLocatie   = Locatie.objects.get(naam=locatieNaam,adres__naam=adressNaam,bedrijf__naam=bedrijfNaam,contact__naam=gebruikerNaam)
    #aLocatie   = Locatie.objects.get(naam=locatieNaam,adres__naam=adressNaam)
    #aLocaties   = Locatie.objects.filter(naam=locatieNaam,adres__naam=adressNaam,bedrijf__naam=bedrijfNaam,contact__naam=gebruikerNaam)
    aLocaties   = Locatie.objects.filter(naam=locatieNaam,adres__naam=adressNaam)

    if not aLocaties or not locatieNaam:
        print("location not found: ",locatieNaam,adressNaam,bedrijfNaam,gebruikerNaam)
        aLocatie = Locatie()
        aLocatie.naam    = locatieNaam
        aLocatie.adres   = aAdress
        aLocatie.bedrijf = aBedrijf
        aLocatie.contact = aUser
        aLocatie.gebied  = aGebied
        aLocatie.save()

        message = "WARNING: Default values added for locatie: "  + locatieNaam + " | " + adressNaam + " | " + bedrijfNaam  + " | " + gebruikerNaam
        addLogEntry(orderNr,message)
    else:
       aLocatie = aLocaties[0] 
       print("location found: ",locatieNaam,adressNaam,bedrijfNaam,gebruikerNaam)
    return aLocatie 

# Service Order
def addServiceOrder(order,bedrijf,locatieNaam,adressNaam,gebruikerNaam):
    aUser = addUser(order,gebruikerNaam)
    aBedrijf   = addBedrijf(order,bedrijf)
    aLocatie   = addLocatie(order,locatieNaam,bedrijf,adressNaam,gebruikerNaam)
    #print("add Adress: ",naam)
    aOrders = ServiceOrder.objects.filter(ordernr=order)
    if not aOrders and order:
        aOrder = ServiceOrder()
        aOrder.ordernr = order
        aOrder.bedrijf = aBedrijf
        aOrder.contact = aUser
        aOrder.locatie = aLocatie
        aOrder.save ()
    
        message = "WARNING: Default values added for service order: "  + order
        addLogEntry(order,message)
    else:
        aOrder = aOrders[0]
    return aOrder

#Camera
def addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam,locatieNm,adressNaam,gebruikerNaam):

    #aServiceOrder = addServiceOrder(orderNr,bedrijfNaam,locatieNaam,adressNaam,gebruikerNaam)
    #print ('aServiceOrder: ', aServiceOrder.ordernr)

    aLocatie  = addLocatie(orderNr,locatieNaam,bedrijfNaam,adressNaam,gebruikerNaam)
    #print ('aLocatie: ', aLocatie.naam)

    #print("Finding aCamera: ",cameraNaam,"-", aLocatie.naam)
    #aCameras    = Camera.objects.get(naam=cameraNaam,locatie__naam=aLocatie.naam)
    aCameras    = Camera.objects.filter(naam=cameraNaam,locatie__naam=aLocatie.naam)

    if not aCameras and  cameraNaam:
        #print("not found aCamera: ",cameraNaam, aLocatie.naam)
        aCamera = Camera()
        aCamera.naam      = cameraNaam
        aCamera.locatie   = aLocatie
        aCamera.type      = "Dahua"
        aCamera.plaats    = "onbekend"
        aCamera.save()
        print('add aCamera name: ',aCamera.naam)

        message = "WARNING: Default values added for camera: "  + cameraNaam +  " | " + locatieNaam
        addLogEntry(orderNr,message)
    else:
        aCamera = aCameras[0]
        #print("Found aCamera: ", aCamera.naam, aLocatie.naam)
    return aCamera 

#Video
def addVideo(request,orderNr,videoNaam,cameraNaam,locatieNaam,bedrijfNaam,videoLink,recFrom,recTill):
    
    print("---------- addVideo -------------")
    print("ordernr:    ",orderNr)
    print("videonaam:  ",videoNaam)
    print("cameranaam: ",cameraNaam)
    print("locatienaam: ",locatieNaam)
    print("bedrijfnaam: ",bedrijfNaam)

    aAdress = addAdress(orderNr,locatieNaam)
    print ("Adress: ",aAdress.naam)

    currentUser = request.user
    aUser =  User.objects.get(id=currentUser.id)

    aCamera  = addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam,locatieNaam,aAdress.naam,aUser.username)
    #aCamera  = addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam,locatieNaam,aAdress.naam,"onbekend")

    #print ("Camera: ",aCamera.naam)
    #aVideo   = Camera.objects.filter(naam=cameraNaam).select_related('locatie')[0]

    locatieId = Locatie.objects.filter(naam=locatieNaam)[0]
    print ('locatieId :',locatieId)

    aVideos   = Video.objects.filter(naam=videoNaam,camera__naam=cameraNaam,camera__locatie=locatieId)
    aOrder=addServiceOrder(orderNr,bedrijfNaam,locatieNaam,aAdress.naam,aUser.username) # LoginUser ?
    
    if not aVideos:
        print("not found aVideo;  ",videoNaam, aCamera.naam)
        aVideo = Video()
        aVideo.naam         = videoNaam
        aVideo.camera       = aCamera
        aVideo.ordernr      = aOrder
        aVideo.video_link   = substring_after(videoLink,getVideoLocation()) 
        if validDate(recFrom):
            aVideo.opname_van   = datetime.strptime(recFrom, '%Y%m%d%H%M%S')
        if validDate(recTill):
            aVideo.opname_tot   = datetime.strptime(recTill, '%Y%m%d%H%M%S') 
        if "h264" in videoNaam:
            aVideo.codec        = "h264"
        else:
            aVideo.codec        = "vp9"
        aVideo.save()

        message = "WARNING: Default values added for video: "  + videoNaam + " | " + aCamera.naam
        addLogEntry(orderNr,message)
    else:
        aVideo = aVideos[0]
        print("Found aVideo;  ",   aVideo.naam , aVideo.camera )

    #print ("Video: ",aVideo.naam)
    return aVideo


# Name extracion
def extractVideoNaam(filename):
    s = filename
    while substring_after(s, "/"):
        s = substring_after(s, "/")
        #print ("s" ,s)
        naam = substring_before(s, ".mp4")
    return naam

def extractDBitems(request,filename):
    inpath=getVideoLocation()
    # print("----------- extractDBitems -----")
   
    inFile = filename.replace(" ", "\\ ")
    print("filename: ",inFile)
    fileItems = re.split("/",inFile)

    itr = 0
    #print("Inpath: ",inpath)
    for item in fileItems:
        print ("fileItems :",itr,item)
        itr += 1
    
    #extract videoLink
    video_link = substring_after(inFile,inpath)
    video_link = inpath + video_link.replace("\\ ", " ")
 
    #print("video_link: ", video_link) 
    #print("video_link: ", video_link) 

    if  "static" in inFile:
        ordernr   = fileItems[6].replace("\\ " , " ")
        bedrijf   = fileItems[5].replace("\\ ", " ")
        locatie   = fileItems[6].replace("\\ ", " ")
        videoNaam = fileItems[9].replace("\\ ", " ")
    else:
        ordernr   = fileItems[6].replace("\\ ", " ")
        bedrijf   = fileItems[3].replace("\\ ", " ")
        locatie   = fileItems[4].replace("\\ ", " ")
        videoNaam = fileItems[7].replace("\\ ", " ")

    #extract videonaam
    naam = substring_before(videoNaam, ".mp4")
 
    #extract camera, record, till, from
    naamItems = re.split("_",videoNaam)

    itr = 0
    for item in naamItems:
        print ("naamItems :",itr,item)
        itr += 1

    #extract Naaam
    s = filename
    while substring_after(s, "/"):
        s = substring_after(s, "/")
        #print ("s" ,s)
        naam = substring_before(s, ".mp4")
    #print ("Naam:    ",naam)

    #extract camera
    camera= substring_before(naam, "_2")
    #print ("Camera:  ", camera)

    # extract recorded from till
    recTill = naam
    while substring_after(recTill, "_"):
        recTill = substring_after(recTill, "_")
    #print("recTill: ",recTill)

    #extract recorded from
    recFrom = substring_before(naam, recTill)
    recFrom = substring_after(recFrom,camera + "_")
    recFrom = substring_before(recFrom,"_")

    #print ("recFrom: " , recFrom)
    #print ("RecTill: " , recTill)
    #print ("Codec:    vp9\n\n")

    addVideo(request,ordernr,naam,camera,locatie,bedrijf,video_link,recFrom,recTill)
    return

def insertConvertedVideos(request):
    inpath=getVideoLocation()
    print('Add Migrated Videos to DB from:',inpath)
    message = 'Add Migrated Videos to DB from:' + inpath
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(inpath, topdown=True):
        for name in files:
            filename = os.path.join(root, name)
            #print("Filename: ",filename)
            #print("Files :",os.path.join(root, name))
            if "Migrated" in filename and "._" not in filename:
                #print('Filename :',filename)
                if ".webm" in filename or ".mp4" in filename and "._" not in filename:
                    extractDBitems(request,filename)
    message = 'Add Converted Videos to DB Ended'
    addLogEntry(" ", message)
    return   

#actions -------------------------------
def convertingVideos(request):
    videoPath     = getVideoLocation()
    maxConverting = getMaximumConvert()
    converting = 1
    
    message = "Converting... Looking for New Videos in " + videoPath
    addLogEntry(" ", message)
    setRunningStatus(True)

    for root, dirs, files in os.walk(videoPath, topdown=True):
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "2Convert" in inFileName:
                #print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName and not "._" in inFileName:
                    #print('inFile :',inFileName)
                    after = substring_after(inFileName,"2Convert/") 
                    if (after and size_changed(inFileName,5)) and (os.path.getsize(inFileName)) > 0:
                        #print('After :',after)
                        orderNr = after[0:after.find("/")]
                        #print('order',orderNr)
                        
                        #make/check output dir
                        destDir = substring_before(inFileName, "2Convert") + "Migrated/" 
                        #print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)

                        # check / create orderNr directory
                        reqDir = destDir + orderNr + "/"
                        print('reqDir :', reqDir)
                        if not os.path.isdir(reqDir):
                            os.mkdir(reqDir)
                
                        outFileName = os.path.join(destDir,after)
                        fSize = getFileSize(inFileName)

                        #probe format
                        inFile = convertFileName(inFileName)
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 " + inFile  + " > ._isFormat"
                        result = os.system(command)
                        with open('._isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                    
                        if "h264" in formatData:
                            # outFileName = outFileName 
                
                            message = 'Copying h264 ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(orderNr,message)
                            shutil.copyfile(inFileName, outFileName)
                            extractDBitems(request,outFileName)
                            userEmail = request.user.email
                            mailMigrationReady(userEmail,outFileName)
                            # removeFile(inFileName) # uncommend for production
                            moveFileToDone(inFileName,orderNr) 
                            
                        else: #conversion needed
                            if converting <= maxConverting:
                                converting += 1
                                startTime = time.perf_counter()
                                message = 'Migrating   ' + inFileName + " Size: " + fSize + " MB"
                                addLogEntry(orderNr,message)

                                #command 
                                #command = "cp " + inFile + " " + outFile 

                                #h264
                                outFileName = outFileName.replace(".mp4", "_conv_h264.mp4")
                                outFileName = outFileName.replace(".MP4","._conv_h264.mp4")

                                outFile = convertFileName(outFileName)
                                
                                #ffmpeg -i input_file.mp4 -c:v libx264 -crf 23 -c:a copy output_file.mp4 -- Chatgpt
                                #command = "ffmpeg -y -i " + inFile
                                #command = command + " -c:v libx264 -crf 23 -c:a copy " + outFile + " &"
                                
                                #ffmpeg -i "$i" -map 0 -c:v libx264 -crf 18 2_10.mp4 -- Option 1
                                command = "ffmpeg -y -threads 1 -i " + inFile
                                #command = "ffmpeg -y -i " + inFile
                                command = command + " -map 0 -c:v libx264 -crf 18 " + outFile + " &"

                                #vb9
                                #outFileName = outFileName.replace(".mp4", ".webm")
                                #outFileName = outFileName.replace(".MP4", ".webm")
                                #outFile = outFileName.replace(" ", "\\ ")
                            
                                #vp9 
                                #command = "ffmpeg -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                            
                                #vp9 twopass
                                #command = "ffmpeg  -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                                #addLogEntry(orderNr,command)
                                #print ('infile: ',inFile)
                                #print ('OutFile: ',outFile)
                                #print('Command :',command) 
                                # removeFile(outFile) # uncomment in production
                    
                                result = os.system(command)
                                #result = 0

                                #print('Result :',result)
                                if result ==  0: # 256 error
                                    message = "To " + outFileName
                                    #message = "Migrated to " + outFileName + " Size: " + fSize + " MB Time: " + elapsed
                                    addLogEntry(orderNr,message)
                                    extractDBitems(request,outFileName)
                                    userEmail = request.user.email
                                    #print('Email: ',userEmail)
                                    mailMigrationReady(userEmail,outFileName)
                                    # removeFile(inFileName) # uncommend for production
                                    # moveFileToDone(inFileName,orderNr) Not yet after conversion 
                                
                                else:
                                    addLogEntry(orderNr,"ERROR : Not Migrated")
                            else:
                                addLogEntry(" ","INFO : Exceeding Number of ffmpeg converions") 
    message = "Migrating Ended "
    addLogEntry(" ", message)
    setRunningStatus(False)
    return

def convertingVideosOrder(request,order):
    #print('Order Conversion')
   
    videoPath     = getVideoLocation()
    maxConverting = getMaximumConvert()
    converting = 1
    
    message = "Order converting Looking for New Videos in " + videoPath 
    addLogEntry(order, message)
    setRunningStatus(True)

    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "2Convert" in inFileName:
                #print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName or inFileName in order and not "._" in inFileName:
                    print('inFile :',inFileName)
                    after = substring_after(inFileName,"2Convert/") 
            
                    if (after and size_changed(inFileName,5)) and (os.path.getsize(inFileName)) > 0:
                      
                        print('After :',after)
                        orderNr = after[0:after.find("/")]
                        print('request:',orderNr)
                        
                        #make/check output dir
                        destDir = substring_before(inFileName, "2Convert") + "Migrated/" 
                       
                        print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)

                        # check / create request directory
                        reqDir = destDir + orderNr + "/"
                        if not os.path.isdir(reqDir):
                            os.mkdir(reqDir)
                
                        fSize = getFileSize(inFileName)

                        outFileName = os.path.join(destDir,after)
                        inFile = convertFileName(inFileName)
                        outFle = convertFileName(outFileName)

                        #probe format
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 " + inFile  + " > ._isFormat"
                        result = os.system(command)
                        with open('._isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                    
                        if "h264" in formatData:
                            outFileName = outFileName 
                
                            message = 'Copying h264 ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(orderNr,message)
                            shutil.copyfile(inFileName, outFileName)
                            extractDBitems(orderNr,outFileName)
                            # removeFile(inFileName) # uncommend for production
                            moveFileToDone(inFileName,request) 
                            
                        else: #conversion needed
                            if converting <= maxConverting:
                                converting += 1
                                startTime = time.time()
                                message = 'Migrating   ' + inFileName + " Size: " + fSize + " MB"
                                addLogEntry(orderNr,message)

                                #command 
                                #command = "cp " + inFile + " " + outFile 

                                #h264
                                outFileName = outFileName.replace(".mp4", "_conv_h264.mp4")
                                outFileName = outFileName.replace(".MP4","._conv_h264.mp4")

                                outFile = convertFileName(outFileName)
                            
                                #ffmpeg -i "$i" -map 0 -c:v libx264 -crf 18 2_10.mp4
                                command = "ffmpeg -y -threads 1 -i " + inFile
                                #command = "ffmpeg -y -i " + inFile
                                command = command + " -map 0 -c:v libx264 -crf 18 " + outFile + " &"
                                #vb9
                                #outFileName = outFileName.replace(".mp4", ".webm")
                                #outFileName = outFileName.replace(".MP4", ".webm")
                                #outFile = outFileName.replace(" ", "\\ ")
                            
                                #vp9 
                                #command = "ffmpeg -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                            
                                #vp9 twopass
                                #command = "ffmpeg  -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                                #addLogEntry(orderNr,command)
                                print('Command :',command) 
                                # removeFile(outFile) # uncomment in production
                            
                                startTime = time.time()
                                
                                result = os.system(command)
                                #result = 0

                                #print('Result :',result)
                                if result ==  0: # 256 error
                                    # Elapsed Time
                                    endTime = time.time()
                                    elapsedTime = endTime - startTime
                                    #elapsed = time.strftime("%H:%M:%S", time.gmtime(elapsedTime))
                                    #fSize = getFilesize(outFileName)
                                    
                                    message = "To " + outFileName 
                                    #message = "Migrated to " + outFileName + " Size: " + fSize + " MB Time: " + elapsed
                                    addLogEntry(orderNr,message)
                        
                                    # removeFile(inFileName) # uncommend for production
                                    # moveFileToDone(inFileName,orderNr) Not yet after conversion 
                                    extractDBitems(request,outFileName)
                                else:
                                    addLogEntry(orderNr,"ERROR : Not Migrated")
                            else:
                                addLogEntry(order,"INFO : Exceeding Number of ffmpeg converions") 
    message = "Order migrating Ended"
    addLogEntry(order, message)
    setRunningStatus(False)
    return

def listVideos():
    videoPath=getVideoLocation()
    message = "Looking for New Videos in " + videoPath + " ..."
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "2Convert" in inFileName:
                print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName and not "._" in inFileName:
                    #print('inFile :',inFileName)
                    after = substring_after(inFileName,"2Convert/") 
            
                    if (after and size_changed(inFileName,1)) and (os.path.getsize(inFileName)) > 0:
                        orderNr = after[0:after.find("/")]
                        print('Ordernr: ",orderNr')
                        fSize = getFileSize(inFileName)

                        #probe format
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1  " +  convertFileName(inFileName) + " > ._isFormat" 
                        #print('Command:',command)
                        result = os.system(command)
                        with open('._isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                        #print ("Fomat data:",formatData)             
                        if "h264" in formatData:
                            message = 'ToCopy h264 ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(orderNr,message)
                        else: #conversion needed
                            message = 'ToConvert    ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(orderNr,message)                
                          
    message = "Listing New Videos Ended "
    addLogEntry(" ", message)
    return

def listConvertedVideos():
    videoPath=getVideoLocation()
    message = "Looking for Migrated Videos in " + videoPath + " ..."
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "Migrated" in inFileName:
                #print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName or ".webm" in inFileName  or ".WEBM" in inFileName  and not "._" in inFileName:
                    #print('inFile :',inFileName)
                    after = substring_after(inFileName,"Migrated/") 
            
                    if (os.path.getsize(inFileName)) > 0:
                        #print('After :',after)
                        orderNr = after[0:after.find("/")]
                        #print('request:',orderNr)
                        
                        fSize =  getFileSize(inFileName)
                        message = 'Migrated '  + inFileName + " Size: " + fSize + " MB"
                        addLogEntry(orderNr,message)                                                      
    message = "Listing Migrated Ended"
    addLogEntry(" ", message)
    return

# make Preview Images
def updateImageInDB(inFileName,imageName):
    videoNaam = extractVideoNaam(inFileName)
    aVideos  = Video.objects.filter(naam=videoNaam)
    if aVideos:
        aVideo = aVideos[0]
        imageName=imageName.replace("\\ "," ")
    
        aVideo.video_image = substring_after(imageName,getVideoLocation())
        aVideo.save()
    return

'''
def hasNoImageFile(inFileName):
    videoNaam = extractVideoNaam(inFileName)
    print('----------------hasNoImage ',videoNaam)
    aVideos  = Video.objects.filter(naam=videoNaam)
    if aVideos:
        aVideo = aVideos[0]
        print('---------------aVideo :',videoNaam, aVideo.video_image,le)
       
        if aVideo.video_image is not None:
            return True
        else:
            return False
    return True
''' 

def makeImage(videoFilename,imageName):
    videoFilename = convertFileName(videoFilename)
    imageName     = convertFileName(imageName)
    #print("making image:",videoFilename,"-> ",imageName)

    # ffmpeg -i input.mp4 -ss 00:00:01.000 -vframes 1 output.png
    command = "ffmpeg -y -i  " + videoFilename  + " -ss 00:00:01.000 -vframes 1 " + imageName
    result = os.system(command)                   
    return result

def makeImages():
    videoPath=getVideoLocation()
    message = "Make preview Images in " + videoPath + ' ...'
    print (message)
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)

            if "Migrated" in inFileName:
                if (".MP4" in inFileName or ".mp4" in inFileName or ".webm" in inFileName  or ".WEBM" in inFileName)  and not "._" in inFileName:
                    after = substring_after(inFileName,"Migrated/") 
            
                    if (os.path.getsize(inFileName)) > 0:
                        orderNr = after[0:after.find("/")]

                        imageName = inFileName
                        imageName = imageName.replace(".mp4", ".jpg")
                        imageName = imageName.replace(".MP4", ".jpg")
                        imageName = imageName.replace(".WEBM", ".jpg")
                        imageName = imageName.replace(".webm", ".jpg")
        
                        #if hasNoImageFile(inFileName):
                        if makeImage(inFileName,imageName) == 0:
                                message = 'Image created from '  + inFileName 
                                updateImageInDB(inFileName,imageName)
                        else:
                            message = 'ERROR: Image created from '  + inFileName 
                            addLogEntry(orderNr,message)
                                                           
    message = "Make preview Images Ended"
    addLogEntry(" ", message)
    return

#Set duration/Length Video
def DurationVideo(videoFilename):
    aVideos  = Video.objects.filter(video_link=videoFilename)
    if aVideos:
        aVideo = aVideos[0]
        if aVideo.duration:
            return True
        else:
            return False

def updateDurationVideoInDB(videoFilename,duration):
    videoNaam = extractVideoNaam(videoFilename)
    aVideos  = Video.objects.filter(naam=videoNaam)
    if aVideos and duration:
        aVideo = aVideos[0]
        aVideo.duration = substring_before(duration, ".") # hh:mmm:ss 
        aVideo.save()
    return

def getDurationVideo(videoFileName):
    inFilename = convertFileName(videoFileName)
    command = "ffprobe -v error -show_entries format=duration  -sexagesimal -of default=noprint_wrappers=1:nokey=1 " +  inFilename  + " > ._isSize"                                                                                                                                                                                                                        
    result = os.system(command)  
    with open('._isSize', 'r') as file:
        durationVideo = file.read().replace('\n', '')  
 
    if result == 0 and durationVideo != '':
        #print('Duration: ',durationVideo)
        updateDurationVideoInDB(videoFileName,durationVideo)    
        return True
    else:
        return False

#Get the Filesize from the VideoFile
def FileSizeVideo(videoFilename):
    aVideos  = Video.objects.filter(video_link=videoFilename)
    if aVideos:
        aVideo = aVideos[0]
       
        if aVideo.file_size:
            return True
    return False

def updateFileSizeVideoInDB(videoFilename,fileSize):
    videoNaam = extractVideoNaam(videoFilename)
    aVideos  = Video.objects.filter(naam=videoNaam)
    if aVideos and fileSize :
        aVideo = aVideos[0]
        aVideo.file_size = fileSize
        aVideo.save()
    return

def getFileSizeVideo(inFilename):
    fSize = getFileSize(inFilename)
    if fSize != 0:
        updateFileSizeVideoInDB(inFilename,fSize)    
        return True
    else:
        return False
    
def getDurationAndFileSizeVideos():
    videoPath=getVideoLocation()
    message = "Getting the duration of the Videos in " + videoPath +' ...'
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
        for name in files:
            inFileName = os.path.join(root, name)
            if "Migrated" in inFileName:
                if (".MP4" in inFileName or ".mp4" in inFileName or ".webm" in inFileName  or ".WEBM" in inFileName)  and not "._" in inFileName:
                    after = substring_after(inFileName,"Migrated/") 
                    if (os.path.getsize(inFileName)) > 0:
                        orderNr = after[0:after.find("/")]
                        
                        # is it set in the db ?
                        if not DurationVideo(inFileName):
                            #print('Setting the duration of ', inFileName) 
                            if getDurationVideo(inFileName):
                                message = 'Setting the duration from '  + inFileName
                            else:
                                message = 'ERROR: Setting duration from '  + inFileName
                                addLogEntry(orderNr,message)

                        # is it set in the db ?
                        if not FileSizeVideo(inFileName):
                            if getFileSizeVideo(inFileName):
                                message = 'Getting the FileSize of '  + inFileName
                            else:
                                message = 'ERROR: Getting the FileSize of '  + inFileName
                            addLogEntry(orderNr,message)
                                                           
                                                  
    message = "End set the length/filesize  from the Videos"
    addLogEntry(" ", message)
    return