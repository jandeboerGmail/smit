from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.conf import settings
from django.db.models import Q
from django import forms
from operator import eq
import os,time,shutil

from camera.models import Gebruiker, Bedrijf, Parameter, Wijk, Camera, Video , Log, Parameter
from camera.forms import GebruikerForm, BedrijfForm, WijkForm, CameraForm, VideoForm 
#from camera.process import *

import datetime
import locale
#import camera.process
import xlwt

#process generic function ----------------------------------------------------
def addLogEntry(orderNr,message):
    aLog = Log()
    aLog.ordernr = orderNr
    aLog.message = message
    aLog.save()
    return

def getParameter(pk):
    aParameter =  Parameter.objects.get(id=pk)
    return aParameter.videoPath

# Convert 265 Video files to 264
videoPath='/home/jan/video/'

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
    videolocation = getParameter(1)
    message = "Looking for New Videos in " + videolocation
    addLogEntry(" ", message)
    for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            # print("Files :",os.path.join(root, name))
            if "2Convert" in filename:
                #print('inFile :',filename)
                if ".MP4" in filename or ".mp4" in filename:
                    after = substring_after(filename,"2Convert/") 
            
                    if (after and size_changed(filename,5)) and (os.path.getsize(filename)) > 0:
                        #print('After :',after)
                        request = after[0:after.find("/")]
                        #print('request:',request)
                        
                        #make/check output dir
                        destDir = substring_before(filename, "2Convert") + "Converted/" 
                       
                        #print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)

                        # check / create request directory
                        reqDir = destDir + request + "/"
                        #print('reqDir :', reqDir)
                        if not os.path.isdir(reqDir):
                            os.mkdir(reqDir)
                
                        outFile = os.path.join(destDir,after)
               
                        outFile = outFile.replace(".mp4", ".webm")
                        outFile = outFile.replace(".MP4", ".webm")

                        outFile = outFile.replace(" ", "\ ")
                        inFile = filename.replace(" ", "\ ")
                        
                     
                        message = 'Converting : ' + inFile + ' to ' + outFile
                        addLogEntry(request,message)

                        #command 
                        #command = "cp " + inFile + " " + outFile 

                        #vb9 onepass
                        #command = "ffmpeg  -i " + inFile
                        #command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                        #vb9 twopass
                        command = "ffmpeg  -i " + inFile
                        command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                        command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                        addLogEntry(request,command)
                        #print('Command :',command) 
                        removeFile(outFile)
                        result = os.system(command)
                        #result = 0

                        #print('Result :',result)
                        if result ==  0: # 256 error
                            addLogEntry(request,"Converted")
                            print("Converted")
                            #removeFile(inFile) uncommend for production
                        else:
                            addLogEntry(request,"ERROR : Not Converted")
#process generic function ----------------------------------------------------
    
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
def indexWijk(request):
    return render(request,'../templates/indexWijk.html', {} )

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
        bedrijf_list = Bedrijf.objects.filter(qset).distinct().order_by('naam','plaats')
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
        bedrijf_list = Bedrijf.objects.filter(qset).distinct().order_by('naam','plaats')
        aantal = bedrijf_list.count
        bedrijf_dict  = {'results' : bedrijf_list , 'aantal' : aantal, "query": query}
    else:
        bedrijf_dict = {}
    return render(request,"../templates/zPlaatsBedrijf.html", bedrijf_dict)

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

# --- Wijk -----------------
@login_required
def allWijk(request):
    wijk_list = Wijk.objects.order_by('naam')
    aantal =  wijk_list.count
    wijk_dict  = {'results' : wijk_list , 'aantal' : aantal}
    return render(request,'../templates/displayWijk.html',wijk_dict )

# Zoek
@login_required
def zNaamWijk (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        wijk_list = Wijk.objects.filter(qset).distinct().order_by('naam')
        aantal = wijk_list.count
        wijk_dict  = {'results' : wijk_list , 'aantal' : aantal, "query": query}
    else:
        wijk_dict = {}
    return render(request,'../templates/zNaamWijk.html', wijk_dict ) 

# Export
@login_required
def exportWijk(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Wijken_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Wijken')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['naam','contact','telefoon','bedrijf','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Wijk.objects.order_by('naam').values_list('naam','contact','telefoon','bedrijf.naam','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
def createWijk(request):
    form = WijkForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = WijkForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijk Toevoegen'}
    return render(request,template_name,context)

@login_required
def editWijk(request,pk):
    try :
        wijk = Wijk.objects.get(id=pk)
    except Wijk.DoesNotExist:
        return redirect('indexWijk')

    form = WijkForm(request.POST or None,instance = wijk)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexWijk'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Wijk'}
    return render(request,template_name,context)

@login_required
def deleteWijk(request,pk):
    try :
        wijk = Wijk.objects.get(id=pk)
    except Wijk.DoesNotExist:
        return redirect('/camera/indexWijk')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        wijk.delete()
        return ( redirect('/camera/indexWijk'))

    template_name = 'deleteRecord.html'
    context = {'item' : wijk , 'title': 'Verwijder Wijk'}
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
def aktionFillLogfile(request):
    
    addLogEntry("ServiceOrder 1","Inserted from Django")
    return redirect('indexAkties')

@login_required
def aktionGetVideoLocation(request):
    
    videolocation = getParameter(1)
    print('Videolocation :',videolocation)
    return redirect('indexAkties')

@login_required
def aktionConvertVideo(request):
    print("ConvertingVideos")
    ConvertingVideos()
   
    return redirect('indexAkties')

'''
      item  = Video.objects.all() # use filter() when you have sth to filter ;)
   form = request.POST # you seem to misinterpret the use of form from django and POST data. you should take a look at [Django with forms][1]
   # you can remove the preview assignment (form =request.POST)
   if request.method == 'POST':
      selected_item = get_object_or_404(Item, pk=request.POST.get('item_id'))
      # get the user you want (connect for example) in the var "user"
      #user.item = selected_item
      #user.save()

      # Then, do a redirect for example

    template_name = 'zoekVideo.html'
    context = {'item' : item , 'title': 'Verwijder Video'}
    return render(request,template_name,context)

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