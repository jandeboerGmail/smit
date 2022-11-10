from re import A
from sqlite3 import Date
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.conf import settings
from django.db.models import Q
from django import forms
from operator import eq
#from itertools import chain 
from django.utils import timezone
from datetime import datetime

from django.core.paginator import Paginator

import os,time,shutil,re

from camera.models import Adress, Gebruiker, Bedrijf, Parameter, Camera, Locatie, Video ,ServiceOrder, Log, Parameter
from camera.forms import AdressForm, GebruikerForm, BedrijfForm, LocatieForm, CameraForm, OrderForm,  VideoForm
#from camera.process import *

# import datetime
import locale
#import camera.process
import xlwt

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
                   
# Create your views here.
def current_datetime(request):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)

def about(request):
    context  = {}
    #return HttpResponse("Hello, world. You're at the Camera About index")
    return render(request,'about.html',context )

def todo(request):
    context  = {}
    return render(request,'todo.html',context )
    # return HttpResponse("Hello, world. You're at the Camera Todo index")

#index
@login_required
def index(request):
    # return HttpResponse("Hello, world. You're at the Camera index.")
    # return render(request,'index.html',{})
    return render(request,'../templates/index.html',{})


@login_required
def indexGebruiker(request):
    return render(request,'../templates/indexGebruiker.html', {} )

@login_required
def indexBedrijf(request):
    return render(request,'../templates/indexBedrijf.html', {} )

@login_required
def indexAdres(request):
    return render(request,'../templates/indexAdres.html', {} )

@login_required
def indexLocatie(request):
    return render(request,'../templates/indexLocatie.html', {} )

@login_required
def indexCamera(request):
    return render(request,'../templates/indexCamera.html', {} )

@login_required
def indexVideo(request):
    return render(request,'../templates/indexVideo.html', {} )

@login_required
def indexOrder(request):
    return render(request,'../templates/indexOrder.html', {} )

@login_required
def indexLog(request):
    return render(request,'../templates/indexLog.html', {} )

@login_required
def indexActies(request):
    return render(request,'../templates/indexActies.html', {} )

# --- Gebruiker
@login_required
def allGebruiker(request):
    gebruiker_list = Gebruiker.objects.order_by('naam')
    aantal =  gebruiker_list.count
    gebruiker_dict  = {'results' : gebruiker_list , 'aantal' : aantal}
    return render(request,'../templates/displayGebruiker.html',gebruiker_dict )

# Zoek
@login_required
def zNaamGebruiker (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        gebruiker_list = Gebruiker.objects.filter(qset).distinct().order_by('soort','naam')
        aantal = gebruiker_list.count
        gebruiker_dict  = {'results' : gebruiker_list , 'aantal' : aantal, "query": query}
    else:
        gebruiker_dict = {}
    return render(request,'../templates/zNaamGebruiker.html', gebruiker_dict ) 

# Export
@login_required
def exportGebruiker(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Gebruikers_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Gebruikers')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['naam','user','email','telefoon','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Gebruiker.objects.order_by('soort','naam').values_list('soort','naam','user','email','telefoon','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createGebruiker(request):
    form = GebruikerForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = GebruikerForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Gebruiker Toevoegen'}
    return render(request,template_name,context)


@login_required
def editGebruiker(request,pk):
    try :
        gebruiker = Gebruiker.objects.get(id=pk)
    except Gebruiker.DoesNotExist:
        return redirect('indexGebruiker')

    form = GebruikerForm(request.POST or None,instance = gebruiker)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexGebruiker'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Gebruiker'}
    return render(request,template_name,context)

@login_required
def deleteGebruiker(request,pk):
    try :
        gebruiker = Gebruiker.objects.get(id=pk)
    except Gebruiker.DoesNotExist:
        return redirect('/camera/indexGebruiker')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        gebruiker.delete()
        return ( redirect('/camera/indexGebruiker'))

    template_name = 'deleteRecord.html'
    context = {'item' : gebruiker , 'title': 'Verwijder Gebruiker'}
    return render(request,template_name,context)

# --- Adress
@login_required
def allAdress(request):
    adress_list = Adress.objects.order_by('plaats','naam')
    aantal =  adress_list.count


    paginator = Paginator(adress_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    adress_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'../templates/displayAdress.html',adress_dict )

@login_required
def zNaamAdress (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        adress_list = Adress.objects.filter(qset).distinct().order_by('naam')
        aantal = adress_list.count
        adress_dict  = {'results' : adress_list , 'aantal' : aantal, "query": query}
    else:
        adress_dict = {}
    return render(request,'../templates/zNaamAdress.html', adress_dict ) 

#CRUD
@login_required
def createAdress(request):
    form = AdressForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = AdressForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Adres'}
    return render(request,template_name,context)


@login_required
def editAdress(request,pk):
        try :
            adress = Adress.objects.get(id=pk)
        except Adress.DoesNotExist:
            return redirect('indexAdres')

        form = AdressForm(request.POST or None,instance = adress)
        # print('Request Method:',request.method)
        if request.method == 'POST':
            if form.is_valid():
                form.save()
                return ( redirect('indexAdres'))

        template_name = 'inputForm.html'
        context = {'form' : form, 'title': 'Wijzig Adres'}
        return render(request,template_name,context)

@login_required
def deleteAdress(request,pk):
        try :
            adress = Adress.objects.get(id=pk)
        except Adress.DoesNotExist:
            return redirect('/camera/indexAdres')

        if request.method == 'POST':
            #print('Deleting Post:',request.POST)
            adress.delete()
            return ( redirect('/camera/indexAdres'))

        template_name = 'deleteRecord.html'
        context = {'item' : adress , 'title': 'Verwijder Bedrijf'}
        return render(request,template_name,context)

# --- Bedrijf
@login_required
def allBedrijf(request):
    bedrijven_list = Bedrijf.objects.order_by('naam')
    aantal =  bedrijven_list.count
    bedrijf_dict  = {'bedrijven' : bedrijven_list , 'aantal' : aantal}
    return render(request,'../templates/displayBedrijf.html',bedrijf_dict )

# Zoek
@login_required
def zNaamBedrijf (request):
    query = request.GET.get('q','')
    if query:
        qset = (
            Q(naam__icontains=query)         
        )       
        bedrijf_list = Bedrijf.objects.filter(qset).distinct().order_by('naam')
        aantal = bedrijf_list.count
        bedrijf_dict  = {'results' : bedrijf_list , 'aantal' : aantal, "query": query}
    else:
        bedrijf_dict = {}
    return render(request,'../templates/zNaamBedrijf.html', bedrijf_dict ) 

@login_required
def zPlaatsBedrijf(request):
    query = request.GET.get('q','')
    if query:
        qset = ( Q(plaats__icontains=query))       
        bedrijf_list = Bedrijf.objects.filter(qset).distinct().order_by('naam')
        aantal = bedrijf_list.count
        bedrijf_dict  = {'results' : bedrijf_list , 'aantal' : aantal, "query": query}
    else:
        bedrijf_dict = {}
    return render(request,'../templates/zNaamBedrijf.html', bedrijf_dict ) 
    #return render(request,"../templates/zPlaatsBedrijf.html", bedrijf_dict)

#Export
@login_required
def exportBedrijf(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Bedrijven_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Bedrijven')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['naam','adres','postcode','plaats','land','telefoon','contact_naam','contact_telefoon',
        'image','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Bedrijf.objects.order_by('naam').values_list('naam','adres','postcode','plaats','land','telefoon','contact_naam','contact_telefoon',
        'image','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createBedrijf(request):
    form = BedrijfForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = BedrijfForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Bedrijf Toevoegen'}
    return render(request,template_name,context)


@login_required
def editBedrijf(request,pk):
        try :
            bedrijf = Bedrijf.objects.get(id=pk)
        except Bedrijf.DoesNotExist:
            return redirect('indexBedrijf')

        form = BedrijfForm(request.POST or None,instance = bedrijf)
        # print('Request Method:',request.method)
        if request.method == 'POST':
            if form.is_valid():
                form.save()
                return ( redirect('indexBedrijf'))

        template_name = 'inputForm.html'
        context = {'form' : form, 'title': 'Wijzig Bedrijf'}
        return render(request,template_name,context)

@login_required
def deleteBedrijf(request,pk):
        try :
            bedrijf = Bedrijf.objects.get(id=pk)
        except Bedrijf.DoesNotExist:
            return redirect('/camera/indexBedrijf')

        if request.method == 'POST':
            #print('Deleting Post:',request.POST)
            bedrijf.delete()
            return ( redirect('/camera/indexBedrijf'))

        template_name = 'deleteRecord.html'
        context = {'item' : bedrijf , 'title': 'Verwijder Bedrijf'}
        return render(request,template_name,context)

# --- Locatie -----------------
@login_required
def allLocatie(request):
    #Locatie_list = Locatie.objects.order_by('naam')
    Locatie_list = Locatie.objects.order_by('bedrijf','adres')
   
    aantal =  Locatie_list.count
    Locatie_dict  = {'results' : Locatie_list , 'aantal' : aantal}
    return render(request,'../templates/displayLocatie.html',Locatie_dict )

# Zoek
@login_required
def zNaamLocatie (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        #Locatie_list = Locatie.objects.filter(qset).distinct().order_by('naam')
        Locatie_list = Locatie.objects.filter(qset).distinct().order_by('bedrijf','adres')
        aantal = Locatie_list.count
        Locatie_dict  = {'results' : Locatie_list , 'aantal' : aantal, "query": query}
    else:
        Locatie_dict = {}
    return render(request,'../templates/zoekLocatie.html', Locatie_dict ) 

# Export
@login_required
def exportLocatie(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Locatie_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Locatie')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['naam','adres','bedrijf','contact','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Locatie.objects.order_by('naam').values_list('naam','adres.naam','bedrijf.naam','contact.naam','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createLocatie(request):
    form = LocatieForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = LocatieForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Locatie Toevoegen'}
    return render(request,template_name,context)

@login_required
def editLocatie(request,pk):
    try :
        locatie = Locatie.objects.get(id=pk)
    except Locatie.DoesNotExist:
        return redirect('indexLocatie')

    form = LocatieForm(request.POST or None,instance = locatie)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexLocatie'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Locatie'}
    return render(request,template_name,context)

@login_required
def deleteLocatie(request,pk):
    try :
        locatie = Locatie.objects.get(id=pk)
    except Locatie.DoesNotExist:
        return redirect('/camera/indexLocatie')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        locatie.delete()
        return ( redirect('/camera/indexLocatie'))

    template_name = 'deleteRecord.html'
    context = {'item' : locatie , 'title': 'Verwijder Locatie'}
    return render(request,template_name,context)

# --- Camera -----------------
@login_required
def allCamera(request):
    camera_list = Camera.objects.order_by('locatie','naam')
    aantal =  camera_list.count
    camera_dict  = {'results' : camera_list , 'aantal' : aantal}
    return render(request,'../templates/displayCamera.html',camera_dict )

# Zoek
@login_required
def zNaamCamera (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        camera_list = Camera.objects.filter(qset).distinct().order_by('naam')
        aantal = camera_list.count
        camera_dict  = {'results' : camera_list , 'aantal' : aantal, "query": query}
    else:
        camera_dict = {}
    return render(request,'../templates/zNaamCamera.html', camera_dict ) 

@login_required
def zLocatieCamera (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(locatie__naam__icontains=query))       
        camera_list = Camera.objects.filter(qset).distinct().order_by('locatie','naam')
        aantal = camera_list.count
        camera_dict  = {'results' : camera_list , 'aantal' : aantal, "query": query}
    else:
        camera_dict = {}
    return render(request,'../templates/zLocatieCamera.html', camera_dict ) 

# Export
@login_required
def exportCamera(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Camera_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Camera')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['naam','contact','telefoon','bedrijf','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Camera.objects.order_by('naam').values_list('naam','contact','telefoon','bedrijf.naam','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createCamera(request):
    form = CameraForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = CameraForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Camera'}
    return render(request,template_name,context)

login_required
def editCamera(request,pk):
    try :
        camera = Camera.objects.get(id=pk)
    except Camera.DoesNotExist:
        return redirect('indexCamera')

    form = CameraForm(request.POST or None,instance = camera)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexCamera'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Camera'}
    return render(request,template_name,context)

@login_required
def deleteCamera(request,pk):
    try :
        camera = Camera.objects.get(id=pk)
    except Camera.DoesNotExist:
        return redirect('/camera/indexCamera')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        camera.delete()
        return ( redirect('/camera/indexCamera'))

    template_name = 'deleteRecord.html'
    context = {'item' : camera , 'title': 'Verwijder Camera'}
    return render(request,template_name,context)

# ---- Video ---------------
@login_required
def allVideo(request):
    video_list = Video.objects.order_by('camera','ordernr','naam')
    aantal =  video_list.count

    paginator = Paginator(video_list,10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    video_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'../templates/displayVideo.html',video_dict )

@login_required
def allVideoThuis(request):
    video_list = Video.objects.filter(video__camera="NVR").distinct().order_by('camera','ordernr','naam')
    aantal =  video_list.count

    paginator = Paginator(video_list,10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    video_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'../templates/displayVideo.html',video_dict )

# Zoek
@login_required
def zNaamVideo (request):
    query = request.GET.get('q','')
    #print ("query: ", query)
    if query:
        qset = (Q(naam__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count
        video_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'../templates/zNaamVideo.html', video_dict )

@login_required
def zOrderVideo (request):
    query = request.GET.get('q','')
    #print ("query: ", query)
    if query:
        #print ("querry: ", query)
        qset = (Q(ordernr__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count
        print ("aantal: ",aantal)
        video_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'../templates/zOrderVideo.html', video_dict )

@login_required
def zCameraVideo (request):
    query = request.GET.get('q','')
    #print ("query: ", query)
    if query:
        print ("querry: ", query)
        qset = (Q(camera__naam__icontains=query))    
        #qset = (Q(locatie__naam__icontains=query))   
        #qset = (Q(naam__icontains=query))  
        #video_list = Video.objects.filter(naam=videoNaam,camera__naam=cameraNaam)   
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count
        print ("aantal: ",aantal)
        video_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'../templates/zCameraVideo.html', video_dict )

@login_required
def zLocatieVideo (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(video__camera__locatie__naam__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('locatie','naam')
        aantal = video_list.count
        camera_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        camera_dict = {}
    return render(request,'../templates/zLocatieVideo.html', camera_dict ) 

# Export
@login_required
def exportVideo(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Video_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Video')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['naam','contact','telefoon','bedrijf','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Video.objects.order_by('naam').values_list('naam','contact','telefoon','bedrijf.naam','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createVideo(request):
    form = VideoForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = VideoForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Video'}
    return render(request,template_name,context)

@login_required
def editVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('indexVideo')

    form = VideoForm(request.POST or None,instance = video)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexVideo'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Video'}
    return render(request,template_name,context)

@login_required
def deleteVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('/camera/indexVideo')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        video.delete()
        return ( redirect('/camera/indexVideo'))

    template_name = 'deleteRecord.html'
    context = {'item' : video , 'title': 'Verwijder Video'}
    return render(request,template_name,context)

@login_required
def playVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('indexVideo')

    video_dict  = {'video' : video }
    return render(request,'../templates/playVideo.html', video_dict )
    '''
    template_name = 'playVideo.html'
    context = {'item' : video , 'title': 'Play Video'}
    return render(request,template_name,context)
    return ( redirect('indexVideo'))
    '''

@login_required
def downloadVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('indexVideo')

    # TODO 
    context  = {}
    return render(request,'todo.html',context )


@login_required
def convertVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('indexVideo')

    # TODO 
    context  = {}
    return render(request,'todo.html',context )

@login_required
def zoekVideo(request):
    # TODO 
    context  = {}
    return render(request,'todo.html',context )

# -----Orders ---
@login_required
def allOrder(request):
    list = ServiceOrder.objects.order_by('ordernr')
    aantal =  list.count

    paginator = Paginator(list,10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'../templates/displayOrder.html',dict )

@login_required
def zNrOrder (request):
    query = request.GET.get('q','')

    if query:
        qset = (Q(ordernr__icontains=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('ordernr')
        aantal = list.count
        dict  = {'results' : list , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'../templates/zNrOrder.html', dict )

def zContactOrder (request):
    query = request.GET.get('q','')

    if query:
        qset = (Q(gcontact__naam__icontain=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('ordernr')
        aantal = list.count
        dict  = {'results' : list , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'../templates/zContactOrder.html', dict )

# Export
@login_required
def exportOrder(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=ServiceOrder' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('ServiceOrder')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['ordernr','bedrijf','contact','conversion_started','conversion_ready','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = ServiceOrder.objects.order_by('ordernr').values_list('ordernr','bedrijf','contact','conversion_started','conversion_ready','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createOrder(request):
    form = OrderForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = OrderForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Service Order'}
    return render(request,template_name,context)

@login_required
def editOrder(request,pk):
    try :
        order = ServiceOrder.objects.get(id=pk)
    except ServiceOrder.DoesNotExist:
        return redirect('indexOrdr')

    form = OrderForm(request.POST or None,instance = order)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexOrder'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Service Order'}
    return render(request,template_name,context)

@login_required
def deleteOrder(request,pk):
    try :
        order = ServiceOrder.objects.get(id=pk)
    except ServiceOrder.DoesNotExist:
        return redirect('/camera/indexOrder')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        order.delete()
        return ( redirect('/camera/indexOrder'))

    template_name = 'deleteRecord.html'
    context = {'item' : order , 'title': 'Verwijder Service Order'}
    return render(request,template_name,context)

# ---- Log ---------------
@login_required
def allLog(request):
    log_list = Log.objects.order_by('-id')
    aantal =  log_list.count

    paginator = Paginator(log_list,20)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    log_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'../templates/displayAllLog.html',log_dict )

# Zoek
@login_required
def zOrderLog (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(ordernr__icontains=query))
     
        log_list = Log.objects.filter(qset).distinct().order_by('id')
        aantal = log_list.count
        log_dict  = {'results' : log_list , 'aantal' : aantal, "query": query}
    else:
        log_dict = {}
    return render(request,'../templates/zOrderLog.html', log_dict )

# Export
@login_required
def exportLog(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Log_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Log')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['id','ordernr','message','datum_inserted']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Log.objects.order_by('id').values_list('id','ordernr','message','datum_inserted')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

# ---- Aktie ---------------
@login_required
def actieDisplayConversionStatus(request):
    if getRunningStatus():
        message  = "Running"
    else:
        message  = "NOT Running"

    html = "<html><body><strong><center>Conversion is %s. </center></strong><body></html>" % message
    return HttpResponse(html)
    #return HttpResponse("Hello, world. You're at the Camera About index")
    #return redirect('indexActies')

@login_required
def actieToggleConversionStatus(request):
    if getRunningStatus():
        setRunningStatus(False)
    else:
       setRunningStatus(True)
    html = "<html><body><strong><center>Conversie status: %s </center></strong><body></html>" % getRunningStatus()
    return HttpResponse(html)
    #return HttpResponse("Hello, world. You're at the Camera About index")
    #return redirect('indexActies')

@login_required
def actieGetVideoLocation(request):
    html = "<html><body><strong><center>Video location: %s </center></strong></body></html>" % getVideoLocation()
    return HttpResponse(html)
    #return redirect('indexActies')

@login_required
def actieConvertVideo(request):
    if getRunningStatus() == False:
        ConvertingVideos()
    return redirect('indexActies')

'''
@login_required
def actieConvertVideo(request):
    if getRunningStatus() == False:
        ConvertingVideos()
    return redirect('indexActies')
'''

@login_required
def actieConvertVideoOrder(request):
    # TODO 
    context  = {}
    return render(request,'todo.html',context )
    
    #if getRunningStatus() == False:
    #   ConvertingVideos()
    #return redirect('indexActies')

@login_required
def actieInsertConvertedVideos(request):
    insertConvertedVideos()
    return redirect('indexActies')

@login_required
def actieAddVideo(request):
    videoLink = "Default/earth.webm"

    #addBedrijf("Order S01","Stadgenoot")
    #addBedrijf("Order S02","Stadgenoot1")

    #addLocatie("Order S01","Stadspark","Stadgenoot")
    #addLocatie("Order S02","Dorpsplein","Stadgenoot")
    #addLocatie("Order S01","Nooduitgang","Stadgenoot")
    #addLocatie("Order S01","Remijden","Stadgenoot")

    #addCamera(orderNr,cameraNaam,locatieNaam,bedrijfNaam)
    #addCamera("Order S01","NVR 1","Remijden","Stadgenoot")
    #addVideo(orderNr,videoNaam,fromDate,tillDate,codec,cameraNaam,locatieNaam,bedrijfNaam,):
    #addVideo(orderNr,videoNaam,cameraNaam,locatieNaam,bedrijfNaam,videoLink):
    #addVideo("Order S01","video 1","NVR 1","Remijden","Stadgenoot",videoLink)
    
    #addVideo("Order S3","video 5","NVR 4","Stadspark","Stadgenoot",videoLink)

    addVideo("Order SN3","video 7","NVR 41","Stadspark","Stadgenoot",videoLink)
    #addVideo("Order S02","video 4 repeat","NVR9 2","Remijden","Stadgenoot",videoLink)
    return redirect('indexActies')

'''
@login_required
def zNaamCamera (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        camera_list = Camera.objects.filter(qset).distinct().order_by('naam')
        aantal = camera_list.count
        camera_dict  = {'results' : camera_list , 'aantal' : aantal, "query": query}
    else:
        camera_dict = {}
    return render(request,'../templates/zNaamCamera.html', camera_dict ) 
'''
