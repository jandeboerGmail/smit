from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.conf import settings
from django.db.models import Q
from django import forms
from operator import eq
from django.utils import timezone
import os,time,shutil

from camera.models import Adress, Gebruiker, Bedrijf, Parameter, Camera, Locatie, Video , Log, Parameter
from camera.forms import AdressForm, GebruikerForm, BedrijfForm, LocatieForm, CameraForm, VideoForm
#from camera.process import *

import datetime
import locale
#import camera.process
import xlwt

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
    return str(aParameter.videoPath)

def runningStatus():
    aParameter =  Parameter.objects.get(id=1)
    return aParameter.conversion_running

def setRunningStatus(status):
    aParameter = Parameter.objects.get(id=1)
    aParameter.conversion_running = status
    aParameter.datum_updated = timezone.now()
    aParameter.save()
    return

# Log generic functions
def addLogEntry(orderNr,message):
    aLog = Log()
    aLog.ordernr = orderNr
    aLog.message = message
    aLog.save()
    return

def addVideoEntry(ordernr,cameraNaam,fileLocation,codec):

    s = fileLocation
    while substring_after(s, "/"):
            s = substring_after(s, "/")
            #print ("s" ,s)
    naam = substring_before(s, ".webm")

    aCamera = Camera.objects.get(naam=cameraNaam)  
    print ('Naam', aCamera.naam)

    now = datetime.datetime.now()

    aVideo = Video()
    aVideo.naam = naam
    aVideo.ordernr = ordernr
    #aVideo.opname_van = now
    #aVideo.opname_tot = now
    aVideo.camera = aCamera
    aVideo.video_link= fileLocation
    aVideo.codec = codec
    #aVideo. datum_inserted = now
    aVideo.save()
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

def ConvertingVideos():
    print('Conversion')
    videolocation = getVideoLocation()
    message = "Looking for New Videos in " + videolocation
    addLogEntry(" ", message)
    setRunningStatus(True)
    videoPath='/home/jan/video/'
    #videoPath = getVideoLocation
    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            inFileName = os.path.join(root, name)
            # print("Files :",os.path.join(root, name))
            if "2Convert" in inFileName:
                #print('inFile :',inFileName)YY
                if ".MP4" in inFileName or ".mp4" in inFileName and not "._" in inFileName:
                    after = substring_after(inFileName,"2Convert/") 
            
                    if (after and size_changed(inFileName,5)) and (os.path.getsize(inFileName)) > 0:
                      
                        #print('After :',after)
                        request = after[0:after.find("/")]
                        #print('request:',request)
                        
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
                            # Elapsed Timeß
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
                            #print("Converted ", inFile )
                            # removeFile(inFileName) # uncommend for production
                        
                            #addVideoEntry(request,"default",outFileName,"vb9")
                        else:
                            addLogEntry(request,"ERROR : Not Converted")
        setRunningStatus(False)

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
def indexAdress(request):
    return render(request,'../templates/indexAdress.html', {} )

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
def indexLog(request):
    return render(request,'../templates/indexLog.html', {} )

@login_required
def indexAkties(request):
    return render(request,'../templates/indexAkties.html', {} )

# --- Gebruiker
@login_required
def allGebruiker(request):
    gebruiker_list = Gebruiker.objects.order_by('soort','naam')
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
    adress_list = Adress.objects.order_by('naam')
    aantal =  adress_list.count
    adress_dict  = {'adresses' : adress_list , 'aantal' : aantal}
    return render(request,'../templates/displayAdress.html',adress_dict )

#CRUD
@login_required
def createAdress(request):
    form = AdressForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = AdressForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Adding Adress'}
    return render(request,template_name,context)


@login_required
def editAdress(request,pk):
        try :
            adress = Adress.objects.get(id=pk)
        except Adress.DoesNotExist:
            return redirect('indexAdress')

        form = AdressForm(request.POST or None,instance = adress)
        # print('Request Method:',request.method)
        if request.method == 'POST':
            if form.is_valid():
                form.save()
                return ( redirect('indexAdress'))

        template_name = 'inputForm.html'
        context = {'form' : form, 'title': 'Change Adress'}
        return render(request,template_name,context)

@login_required
def deleteAdress(request,pk):
        try :
            adress = Adress.objects.get(id=pk)
        except Adress.DoesNotExist:
            return redirect('/camera/indexAdress')

        if request.method == 'POST':
            #print('Deleting Post:',request.POST)
            adress.delete()
            return ( redirect('/camera/indexAdres'))

        template_name = 'deleteRecord.html'
        context = {'item' : adress , 'title': 'Delete Bedrijf'}
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
    Locatie_list = Locatie.objects.order_by('naam')
    aantal =  Locatie_list.count
    Locatie_dict  = {'results' : Locatie_list , 'aantal' : aantal}
    return render(request,'../templates/displayLocatie.html',Locatie_dict )

# Zoek
@login_required
def zNaamLocatie (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        Locatie_list = Locatie.objects.filter(qset).distinct().order_by('naam')
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
        Locatie = Locatie.objects.get(id=pk)
    except Locatie.DoesNotExist:
        return redirect('indexLocatie')

    form = LocatieForm(request.POST or None,instance = Locatie)
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
        Locatie = Locatie.objects.get(id=pk)
    except Locatie.DoesNotExist:
        return redirect('/camera/indexLocatie')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        Locatie.delete()
        return ( redirect('/camera/indexLocatie'))

    template_name = 'deleteRecord.html'
    context = {'item' : Locatie , 'title': 'Verwijder Locatie'}
    return render(request,template_name,context)

# --- Camera -----------------
@login_required
def allCamera(request):
    camera_list = Camera.objects.order_by('naam')
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
    context = {'form' : form, 'title': 'Camera Toevoegen'}
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
    video_list = Video.objects.order_by('ordernr','naam')
    aantal =  video_list.count
    video_dict  = {'results' : video_list , 'aantal' : aantal}
    return render(request,'../templates/displayVideo.html',video_dict )

# Zoek
@login_required
def zNaamVideo (request):
    query = request.GET.get('q','')
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
    if query:
        qset = (Q(ordernr__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count
        video_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'../templates/zOrderVideo.html', video_dict )

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
    context = {'form' : form, 'title': 'Video Toevoegen'}
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

# ---- Log ---------------
@login_required
def allLog(request):
    log_list = Log.objects.order_by('-id')
    aantal =  log_list.count
    video_dict  = {'results' : log_list , 'aantal' : aantal}
    return render(request,'../templates/displayAllLog.html',video_dict )

# Zoek
@login_required
def zOrderLog (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(ordernr__icontains=query))
     
        log_list = Log.objects.filter(qset).distinct().order_by('id')
        aantal = log_list.count
        video_dict  = {'results' : log_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'../templates/zOrderLog.html', video_dict )

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
def aktionDisplayConversionStatus(request):
    if runningStatus():
        message  = "Running"
    else:
        message  = "NOT Running"

    html = "<html><body>Converion is %s.</body></html>" % message
    return HttpResponse(html)
    #return HttpResponse("Hello, world. You're at the Camera About index")
    #return redirect('indexAkties')

@login_required
def aktionGetVideoLocation(request):
    videolocation = getVideoLocation()
    print('Videolocation :',videolocation)
    return redirect('indexAkties')

@login_required
def aktionConvertVideo(request):
    ConvertingVideos()
    return redirect('indexAkties')

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