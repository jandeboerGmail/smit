import os,time,shutil,re
from django.utils import timezone
from datetime import datetime
from django.core.mail import send_mail, EmailMessage
#from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User

from camera.models import Adress, Account, Bedrijf, Parameter, Camera, Locatie, Video ,ServiceOrder, Log, Parameter, Gebied

# generic functions
def validDate(dateIn):
    #  CCYYMMDDHHmmss
    date_pattern = "^[1-9][0-9][0-9][0-9][0-2][0-9][0-3][0-9][0-2][0-9][0-5][0-9][0-5][0-9]$"
    return  re.match(date_pattern, dateIn) # Returns Match object

# Video security

def checkVideos (aUserId,bedrijf):   
    aUser =  User.objects.get(id=aUserId)     
    aAccount = Account.objects.get(user_id=aUserId)
    #print ("Naam, gebied, superuser:" ,aUser.username,aAccount.email2,aAccount.gebied,aUser.is_superuser)

    if bedrijf == "*" :
        aVideoList = Video.objects.order_by('-datum_updated','ordernr','naam','camera')
        print("All vides")
    else:
        aVideoList = Video.objects.filter(camera__locatie__bedrijf__naam__icontains=bedrijf).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
        print("Selected videos")
    if aUser.is_superuser:
        return aVideoList
    else:
        validatedVideos = []
      
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
       
# Log functions
def addLogEntry(orderNr,message):
    aLog = Log()
    aLog.ordernr = orderNr
    aLog.message = message
    aLog.save()
    return

def checkVideosNaam(aUserId,bedrijf,naam):   
    aUser =  User.objects.get(id=aUserId)     
    aAccount = Account.objects.get(user_id=aUserId)

    if bedrijf == "*" :
        aVideoList = Video.objects.filter(naam__icontains=naam).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
        print("All videos")
    else:
        aVideoList = Video.objects.filter(camera__locatie__bedrijf__naam__icontains=bedrijf,naam__icontains=naam).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
        print("Selected videos")
    
    if aUser.is_superuser:
        return aVideoList
    else:
        validatedVideos = []
      
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
       
# Log functions
def addLogEntry(orderNr,message):
    aLog = Log()
    aLog.ordernr = orderNr
    aLog.message = message
    aLog.save()
    return


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
    aGebiedNr = 0 

    aGebieden = Gebied.objects.filter(bedrijf__naam=bedrijfNaam,gebiedNr=aGebiedNr)
    if not aGebieden and bedrijfNaam:
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

    print('Add Locatie: ',orderNr,locatieNaam,bedrijfNaam,adressNaam,gebruikerNaam)
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

    if not aLocaties and locatieNaam:
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
        aCamera.type      = "default"
        aCamera.plaats    = "default"
        aCamera.save()
        print('add aCamera name: ',aCamera.naam)

        message = "WARNING: Default values added for camera: "  + cameraNaam +  " | " + locatieNaam
        addLogEntry(orderNr,message)
    else:
        aCamera = aCameras[0]
        #print("Found aCamera: ", aCamera.naam, aLocatie.naam)
    return aCamera 

#Video
def addVideo(orderNr,videoNaam,cameraNaam,locatieNaam,bedrijfNaam,videoLink,recFrom,recTill):
    
    print("---------- addVideo -------------")
    print("ordernr:    ",orderNr)
    print("videonaam:  ",videoNaam)
    print("cameranaam: ",cameraNaam)
    print("locatienaam: ",locatieNaam)
    print("bedrijfnaam: ",bedrijfNaam)

    aAdress = addAdress(orderNr,locatieNaam)
    print ("Adress: ",aAdress.naam)

    aCamera  = addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam,locatieNaam,aAdress.naam,"onbekend")

    #print ("Camera: ",aCamera.naam)

    #aVideo   = Camera.objects.filter(naam=cameraNaam).select_related('locatie')[0]
    locatieId = Locatie.objects.filter(naam=locatieNaam)[0]
    print ('locatieId :',locatieId)
    aVideos   = Video.objects.filter(naam=videoNaam,camera__naam=cameraNaam,camera__locatie=locatieId)

    aOrder=addServiceOrder(orderNr,bedrijfNaam,locatieNaam,aAdress.naam,"onbekend") # LoginUser ?

    #print ("aUser: ",aCamera.naam)

    if not aVideos:
        print("not found aVideo;  ",videoNaam, aCamera.naam)
        aVideo = Video()
        aVideo.naam         = videoNaam
        aVideo.camera       = aCamera
        aVideo.ordernr      = aOrder
        aVideo.video_link   = videoLink
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

# Log generic functions
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
    #print('Move File :',fileName)
    #print('request:',request)    

    destFileName = fileName.replace("2Convert", "2_Convert")
    destDir = substring_before(destFileName, "2_Convert") + "2_Convert/"

    # Check if 2_Convert directory exists
    print('destDir :',destDir)
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

def extractDBitems(filename):
    inpath=getVideoLocation()
    # print("----------- extractDBitems -----")
   
    inFile = filename.replace(" ", "\ ")
    print("filename: ",inFile)
    fileItems = re.split("/",inFile)

    itr = 0
    #print("Inpath: ",inpath)
    for item in fileItems:
        print ("fileItems :",itr,item)
        itr += 1
    
    #extract videoLink
    video_link = substring_after(inFile,inpath)
    video_link = inpath + video_link.replace("\ ", " ")
    #print("video_link: ", video_link) 

    if  "static" in inFile:
        ordernr   = fileItems[8].replace("\ ", " ")
        bedrijf   = fileItems[5].replace("\ ", " ")
        locatie   = fileItems[6].replace("\ ", " ")
        videoNaam = fileItems[9].replace("\ ", " ")
    else:
        ordernr   = fileItems[7].replace("\ ", " ")
        bedrijf   = fileItems[4].replace("\ ", " ")
        locatie   = fileItems[5].replace("\ ", " ")
        videoNaam = fileItems[8].replace("\ ", " ")


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

    addVideo(ordernr,naam,camera,locatie,bedrijf,video_link,recFrom,recTill)
    return

def insertConvertedVideos():
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
                    extractDBitems(filename)
    message = 'Add Converted Videos to DB Ended'
    addLogEntry(" ", message)
    return   

def ConvertingVideos():
    print('Conversion')
   
    videoPath     = getVideoLocation()
    maxConverting = getMaximumConvert()
    converting = 1
    
    message = "Converting Looking for New Videos in " + videoPath
    addLogEntry(" ", message)
    setRunningStatus(True)

    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "2Convert" in inFileName:
                #print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName and not "._" in inFileName:
                    print('inFile :',inFileName)
                    after = substring_after(inFileName,"2Convert/") 
            
                    if (after and size_changed(inFileName,5)) and (os.path.getsize(inFileName)) > 0:
                      
                        print('After :',after)
                        request = after[0:after.find("/")]
                        print('request:',request)
                        
                        #make/check output dir
                        destDir = substring_before(inFileName, "2Convert") + "Migrated/" 
                       
                        print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)

                        # check / create request directory
                        reqDir = destDir + request + "/"
                        print('reqDir :', reqDir)
                        if not os.path.isdir(reqDir):
                            os.mkdir(reqDir)
                
                        outFileName = os.path.join(destDir,after)
            
                        outFile = outFileName.replace(" ", "\ ")
                        inFile = inFileName.replace(" ", "\ ")

                        file_stats = os.stat(inFileName)
                        #print(file_stats)
                        fileSize = file_stats.st_size / (1024 * 1024)
                        fSize = "%.5f" % fileSize

                        #probe format
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 " + inFile  + " > ._isFormat"
                        result = os.system(command)
                        with open('._isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                    
                        if "h264" in formatData:
                            outFileName = outFileName 
                
                            message = 'Copying h264 ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(request,message)
                            shutil.copyfile(inFileName, outFileName)
                            extractDBitems(outFileName)
                            # removeFile(inFileName) # uncommend for production
                            moveFileToDone(inFileName,request) 
                            
                        else: #conversion needed
                            if converting <= maxConverting:
                                converting += 1
                                startTime = time.time()
                                message = 'Migrating   ' + inFileName + " Size: " + fSize + " MB"
                                addLogEntry(request,message)

                                #command 
                                #command = "cp " + inFile + " " + outFile 

                                #h264
                                outFileName = outFileName.replace(".mp4", "_conv_h264.mp4")
                                outFileName = outFileName.replace(".MP4","._conv_h264.mp4")
                                outFile = outFileName.replace(" ", "\ ")
                            
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
                                #outFile = outFileName.replace(" ", "\ ")
                            
                                #vp9 
                                #command = "ffmpeg -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                            
                                #vp9 twopass
                                #command = "ffmpeg  -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                                #addLogEntry(request,command)
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

                                    # fileSize
                                    #file_stats = os.stat(outFileName)
                                    ##print(file_stats)
                                    #fileSize = file_stats.st_size / (1024 * 1024)
                                    #fSize = "%.5f" % fileSize
                                    
                                    message = "To " + outFileName 
                                    #message = "Migrated to " + outFileName + " Size: " + fSize + " MB Time: " + elapsed
                                    addLogEntry(request,message)
                        
                                    # removeFile(inFileName) # uncommend for production
                                    # moveFileToDone(inFileName,request) Not yet after conversion 
                                    extractDBitems(outFileName)
                                else:
                                    addLogEntry(request,"ERROR : Not Migrated")
                            else:
                                addLogEntry(" ","INFO : Exceeding Number of ffmpeg converions") 
    message = "Migrating Ended "
    addLogEntry(" ", message)
    setRunningStatus(False)
    return

def ConvertingVideosOrder(order):
    print('Order Conversion')
   
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
                        request = after[0:after.find("/")]
                        print('request:',request)
                        
                        #make/check output dir
                        destDir = substring_before(inFileName, "2Convert") + "Migrated/" 
                       
                        print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)

                        # check / create request directory
                        reqDir = destDir + request + "/"
                        print('reqDir :', reqDir)
                        if not os.path.isdir(reqDir):
                            os.mkdir(reqDir)
                
                        outFileName = os.path.join(destDir,after)
            
                        outFile = outFileName.replace(" ", "\ ")
                        inFile = inFileName.replace(" ", "\ ")

                        file_stats = os.stat(inFileName)
                        #print(file_stats)
                        fileSize = file_stats.st_size / (1024 * 1024)
                        fSize = "%.5f" % fileSize

                        #probe format
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 " + inFile  + " > ._isFormat"
                        result = os.system(command)
                        with open('._isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                    
                        if "h264" in formatData:
                            outFileName = outFileName 
                
                            message = 'Copying h264 ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(request,message)
                            shutil.copyfile(inFileName, outFileName)
                            extractDBitems(outFileName)
                            # removeFile(inFileName) # uncommend for production
                            moveFileToDone(inFileName,request) 
                            
                        else: #conversion needed
                            if converting <= maxConverting:
                                converting += 1
                                startTime = time.time()
                                message = 'Migrating   ' + inFileName + " Size: " + fSize + " MB"
                                addLogEntry(request,message)

                                #command 
                                #command = "cp " + inFile + " " + outFile 

                                #h264
                                outFileName = outFileName.replace(".mp4", "_conv_h264.mp4")
                                outFileName = outFileName.replace(".MP4","._conv_h264.mp4")
                                outFile = outFileName.replace(" ", "\ ")
                            
                                #ffmpeg -i "$i" -map 0 -c:v libx264 -crf 18 2_10.mp4
                                command = "ffmpeg -y -threads 1 -i " + inFile
                                #command = "ffmpeg -y -i " + inFile
                                command = command + " -map 0 -c:v libx264 -crf 18 " + outFile + " &"
                                #vb9
                                #outFileName = outFileName.replace(".mp4", ".webm")
                                #outFileName = outFileName.replace(".MP4", ".webm")
                                #outFile = outFileName.replace(" ", "\ ")
                            
                                #vp9 
                                #command = "ffmpeg -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                            
                                #vp9 twopass
                                #command = "ffmpeg  -y -i " + inFile
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                                #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                                #addLogEntry(request,command)
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

                                    # fileSize
                                    #file_stats = os.stat(outFileName)
                                    ##print(file_stats)
                                    #fileSize = file_stats.st_size / (1024 * 1024)
                                    #fSize = "%.5f" % fileSize
                                    
                                    message = "To " + outFileName 
                                    #message = "Migrated to " + outFileName + " Size: " + fSize + " MB Time: " + elapsed
                                    addLogEntry(request,message)
                        
                                    # removeFile(inFileName) # uncommend for production
                                    # moveFileToDone(inFileName,request) Not yet after conversion 
                                    extractDBitems(outFileName)
                                else:
                                    addLogEntry(request,"ERROR : Not Migrated")
                            else:
                                addLogEntry(order,"INFO : Exceeding Number of ffmpeg converions") 
    message = "Order migrating Ended"
    addLogEntry(order, message)
    setRunningStatus(False)
    return

def ListVideos():
    videoPath=getVideoLocation()
    message = "Looking for New Videos in " + videoPath
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "2Convert" in inFileName:
                #print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName and not "._" in inFileName:
                    print('inFile :',inFileName)
                    after = substring_after(inFileName,"2Convert/") 
            
                    if (after and size_changed(inFileName,1)) and (os.path.getsize(inFileName)) > 0:
                        #print('After :',after)
                        request = after[0:after.find("/")]
                        #print('request:',request)
                        
                        inFile = inFileName.replace(" ", "\ ")
                        file_stats = os.stat(inFileName)
                        fileSize = file_stats.st_size / (1024 * 1024)
                        fSize = "%.5f" % fileSize

                        #probe format
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 " + inFile  + " > ._isFormat"
                        result = os.system(command)
                        with open('._isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                    
                        if "h264" in formatData:
                            message = 'ToCopy h264 ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(request,message)
                        else: #conversion needed
                            message = 'ToConvert    ' + inFileName + " Size: " + fSize + " MB"
                            addLogEntry(request,message)                
                          
    message = "Listing Ended "
    addLogEntry(" ", message)
    return

def ListConvertedVideos():
    videoPath=getVideoLocation()
    message = "Looking for Migrated Videos in " + videoPath
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            if "Migrated" in inFileName:
                #print('inFile :',inFileName)
                if ".MP4" in inFileName or ".mp4" in inFileName or ".webm" in inFileName  or ".WEBM" in inFileName  and not "._" in inFileName:
                    print('inFile :',inFileName)
                    after = substring_after(inFileName,"Migrated/") 
            
                    if (os.path.getsize(inFileName)) > 0:
                        #print('After :',after)
                        request = after[0:after.find("/")]
                        #print('request:',request)
                        
                        inFile = inFileName.replace(" ", "\ ")
                        file_stats = os.stat(inFileName)
                        fileSize = file_stats.st_size / (1024 * 1024)
                        fSize = "%.5f" % fileSize

                        message = 'Migrated '  + inFileName + " Size: " + fSize + " MB"
                        addLogEntry(request,message)
                                                           
    message = "Listing Migrated Ended"
    addLogEntry(" ", message)
    return
                 
def valid_email_address(email_address):

    try:
        validate_email(email_address)
        valid_email = True

    except ValidationError:
        valid_email = False

    return valid_email 

def SendMail(subject,message,recipentList):
     
    emailcheckedRecepentList = []
    
    request = " "
    for emailAdress in recipentList:
        #print ("email_adress :",emailAdress)
        
        if valid_email_address(emailAdress):
            emailcheckedRecepentList.append(emailAdress)       
            errorMessage = 'INFO : Mail send to: '  + emailAdress
            addLogEntry(request,errorMessage) 

        else:
            errorMessage = 'INFO : Wrong email Adress Specified: '  + emailAdress
            addLogEntry(request,errorMessage) 

    #print ("emailcheckedRecepentList :",emailcheckedRecepentList)    
    #chatgpt
    email = EmailMessage(
        subject, message, 
        'sgportal@smitelektrotechniek.nl', 
        emailcheckedRecepentList, 
        reply_to=['sgportal@smitelektrotechniek.nl'], 
                #headers={'Message-ID': 'foo'},
    )
    email.send()

    return