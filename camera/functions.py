import os,time,shutil,re
from django.utils import timezone
from datetime import datetime
from camera.models import Adress, Gebruiker, Bedrijf, Parameter, Camera, Locatie, Video ,ServiceOrder, Log, Parameter

# generic functions
def validDate(dateIn):
    #  CCYYMMDDHHmmss
    date_pattern = "^[1-9][0-9][0-9][0-9][0-2][0-9][0-3][0-9][0-2][0-9][0-5][0-9][0-5][0-9]$"
    return  re.match(date_pattern, dateIn) # Returns Match object

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

#Gebruiker
def addGebruiker(orderNr,naam):
    aAdress = addAdress(orderNr,naam)

    aGebruikers = Gebruiker.objects.filter(naam=naam)
    if not aGebruikers and naam:
        aGebruiker = Gebruiker()
        aGebruiker.naam = naam
        aGebruiker.adres = aAdress
        aGebruiker.save()

        message = "WARNING: Default values added for gebruiker: "  + naam 
        addLogEntry(orderNr,message)
    else:
        aGebruiker =  aGebruikers[0]
    return aGebruiker   

#Locatie
def addLocatie(orderNr,locatieNaam,bedrijfNaam,adressNaam,gebruikerNaam):

    aBedrijf   = addBedrijf(orderNr,bedrijfNaam)
    aGebruiker = addGebruiker(orderNr,"Default")
    aAdress    = addAdress(orderNr,adressNaam)

    #print ("Locatie: ", locatieNaam, "-",aAdress.naam,"-",aBedrijf.naam, "-",aGebruiker.naam)

    #aLocatie   = Locatie.objects.filter(naam=locatieNaam).select_related('bedrijf')[0]
    #aLocatie   = Locatie.objects.get(naam=locatieNaam,adres__naam=adressNaam,bedrijf__naam=bedrijfNaam,contact__naam=gebruikerNaam)
    #aLocatie   = Locatie.objects.get(naam=locatieNaam,adres__naam=adressNaam)
    aLocaties   = Locatie.objects.filter(naam=locatieNaam,adres__naam=adressNaam,bedrijf__naam=bedrijfNaam,contact__naam=gebruikerNaam)

    if not aLocaties and locatieNaam:
        #print("not found location;  ",locatieNaam,bedrijfNaam)
        aLocatie = Locatie()
        aLocatie.naam    = locatieNaam
        aLocatie.adres   = aAdress
        aLocatie.bedrijf = aBedrijf
        aLocatie.contact = aGebruiker
        aLocatie.save()

        message = "WARNING: Default values added for locatie: "  + locatieNaam + " | " + adressNaam + " | " + bedrijfNaam  + " | " + gebruikerNaam
        addLogEntry(orderNr,message)
    else:
       aLocatie = aLocaties[0] 
    return aLocatie 

#Camera
def addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam,adressNaam,gebruikerNaam):

    aLocatie  = addLocatie(orderNr,locatieNaam,bedrijfNaam,adressNaam,gebruikerNaam)
    print ('aLocatie: ', aLocatie.naam)

    print("Finding aCamera: ",cameraNaam,"-", aLocatie.naam)
    #aCameras    = Camera.objects.get(naam=cameraNaam,locatie__naam=aLocatie.naam)
    aCameras    = Camera.objects.filter(naam=cameraNaam,locatie__naam=aLocatie.naam)

    if not aCameras and  cameraNaam:
        print("not found aCamera: ",cameraNaam, aLocatie.naam)
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
        print("Found aCamera: ", aCamera.naam, aLocatie.naam)
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

    aCamera  = addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam,aAdress.naam,"default")
    print ("Camera: ",aCamera.naam)

    #aVideo   = Camera.objects.filter(naam=cameraNaam).select_related('locatie')[0]
    aVideos   = Video.objects.filter(naam=videoNaam,camera__naam=cameraNaam)

    if not aVideos:
        print("not found aVideo;  ",videoNaam, aCamera.naam)
        aVideo = Video()
        aVideo.naam         = videoNaam
        aVideo.camera       = aCamera
        aVideo.ordernr      = orderNr
        aVideo.video_link   = videoLink
        if validDate(recFrom):
            aVideo.opname_van   = datetime.strptime(recFrom, '%Y%m%d%H%M%S')
        if validDate(recTill):
            aVideo.opname_tot   = datetime.strptime(recTill, '%Y%m%d%H%M%S') 
        #aVideo.codec        = codec
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
    #print("filename: ",inFile)
    fileItems = re.split("/",inFile)

    '''
    itr = 0
    #print("Inpath: ",inpath)
    for item in fileItems:
        print ("fileItems :",itr,item)
        itr += 1
    '''
    
    #extract videoLink
    video_link = substring_after(inFile,inpath)
    video_link = video_link.replace("\ ", " ")
    #print("video_link: ", video_link) 

    ordernr   = fileItems[7].replace("\ ", " ")
    bedrijf   = fileItems[4].replace("\ ", " ")
    locatie   = fileItems[5].replace("\ ", " ")
    videoNaam = fileItems[8].replace("\ ", " ")

    #extract videonaam
    naam = substring_before(videoNaam, ".webm")
 
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
        naam = substring_before(s, ".webm")
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
    #print ("Codec:    vb9\n\n")

    addVideo(ordernr,naam,camera,locatie,bedrijf,video_link,recFrom,recTill)
    return

def insertConvertedVideos():
    inpath=getVideoLocation()
    print('Add Converted Videos to DB from:',inpath)
    for root, dirs, files in os.walk(inpath, topdown=True):
        for name in files:
            filename = os.path.join(root, name)
            #print("Filename: ",filename)
            #print("Files :",os.path.join(root, name))
            if "Converted" in filename and "x_" not in filename:
                #print('Filename :',filename)
                if ".webm" in filename and "._" not in filename:
                    extractDBitems(filename)

    return   

def ConvertingVideos():
    print('Conversion')
   
    videoPath=getVideoLocation()
    
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
                        destDir = substring_before(inFileName, "2Convert") + "Converted/" 
                       
                        #print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)

                        # check / create request directory
                        reqDir = destDir + request + "/"
                        #print('reqDir :', reqDir)
                        if not os.path.isdir(reqDir):
                            os.mkdir(reqDir)
                
                        outFileName = os.path.join(destDir,after)
               
                        outFileName = outFileName.replace(".mp4", ".webm")
                        outFileName = outFileName.replace(".MP4", ".webm")

                        outFile = outFileName.replace(" ", "\ ")
                        inFile = inFileName.replace(" ", "\ ")

                        file_stats = os.stat(inFileName)
                        #print(file_stats)
                        fileSize = file_stats.st_size / (1024 * 1024)
                        fSize = "%.5f" % fileSize

                        startTime = time.time()
                        message = 'Converting   ' + inFileName + " Size: " + fSize + " MB"
                        addLogEntry(request,message)

                        #command 
                        #command = "cp " + inFile + " " + outFile 

                        #vb9 onepass
                        command = "ffmpeg -y -i " + inFile
                        command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                        #vb9 twopass
                        #command = "ffmpeg  -y -i " + inFile
                        #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                        #command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                        #addLogEntry(request,command)
                        #print('Command :',command) 
                        # removeFile(outFile) # uncomment in production

                        startTime = time.time()
                        result = os.system(command)
                        #result = 0

                        #print('Result :',result)
                        if result ==  0: # 256 error
                            # Elapsed Time
                            endTime = time.time()
                            elapsedTime = endTime - startTime
                            elapsed = time.strftime("%H:%M:%S", time.gmtime(elapsedTime))

                            # fileSize
                            file_stats = os.stat(outFileName)
                            #print(file_stats)
                            fileSize = file_stats.st_size / (1024 * 1024)
                            fSize = "%.5f" % fileSize

                            message = "Converted to " + outFileName + " Size: " + fSize + " MB Time: " + elapsed
                            addLogEntry(request,message)
                        
                            # removeFile(inFileName) # uncommend for production
                            extractDBitems(outFileName)
            
                        else:
                            addLogEntry(request,"ERROR : Not Converted")
    message = "Converting Ended "
    addLogEntry(" ", message)
    setRunningStatus(False)
    return
                   