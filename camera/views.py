#from re import A
#from sqlite3 import Date
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.conf import settings
from django.db.models import Q
from django import forms
from operator import eq
from django.utils import timezone
from django.core.paginator import Paginator
from datetime import datetime
from itertools import chain

import camera.functions as functions
from camera.models import Adress, Gebruiker, Bedrijf, Camera, Locatie, Video ,ServiceOrder, Log, Parameter
from camera.forms import AdressForm, GebruikerForm, BedrijfForm, LocatieForm, CameraForm, OrderForm,  VideoForm

import os,time,shutil,re,locale,xlwt

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
    locatie_list = Locatie.objects.order_by('bedrijf','adres')
    aantal =  locatie_list.count

    paginator = Paginator(locatie_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    Locatie_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
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

    paginator = Paginator(camera_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    camera_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
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

@login_required
def allVideoStadgenoot(request):
    #camera  = Camera.objects.all()
    #locatie  = Locatie.objects.all()
    mList = Camera.objects.filter(locatie__bedrijf__naam__icontains="Stad").distinct()
    video  = Video.objects.select_related('camera')

    #mList = list(chain(camera,video))
    #mList = camera.union(video)

    #list = Camera.objects.filter(locatie__bedrijf__naam__icontains="Berk").distinct()
    #list = Camera.objects.filter(locatie__bedrijf__naam="Berkhout").distinct()
    #list = Camera.objects.filter(locatie__bedrijf__naam="Stadgenoot").distinct()

    #list = Video.objects.filter(camera__naam__icontains="NVR").distinct().order_by('camera','ordernr','naam')
    #video_list = Video.objects.filter(camera__naam="NVR").distinct().order_by('camera','ordernr','naam')
    #video_list = Video.objects.order_by('camera','ordernr','naam')
    aantal = mList.count

    paginator = Paginator(mList,10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    #return render(request,'../templates/displayVideo.html',dict )
    return render(request,'../templates/displayCamera.html',dict )

# Zoek
@login_required
def zNaamVideo (request):
    query = request.GET.get('q','')
    #print ("query: ", query)
    if query:
        qset = (Q(naam__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count

        paginator = Paginator(video_list,10)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
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

        paginator = Paginator(video_list,10)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
     
        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
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

        paginator = Paginator(list,10)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'../templates/zNrOrder.html', dict )

def zContactOrder (request):
    query = request.GET.get('q','')

    if query:
        qset = (Q(contact__naam__contains=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('ordernr')
        aantal = list.count

        paginator = Paginator(list,10)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        
        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
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
    if functions.getRunningStatus():
        message  = "Running"
    else:
        message  = "NOT Running"

    html = "<html><body><strong><center>Conversion is %s. </center></strong><body></html>" % message
    return HttpResponse(html)
    #return HttpResponse("Hello, world. You're at the Camera About index")
    #return redirect('indexActies')

@login_required
def actieToggleConversionStatus(request):
    if functions.getRunningStatus():
        functions.setRunningStatus(False)
    else:
       functions.setRunningStatus(True)
    html = "<html><body><strong><center>Conversie status: %s </center></strong><body></html>" % functions.getRunningStatus()
    return HttpResponse(html)
    #return HttpResponse("Hello, world. You're at the Camera About index")
    #return redirect('indexActies')

@login_required
def actieGetVideoLocation(request):
    html = "<html><body><strong><center>Video location: %s </center></strong></body></html>" % functions.getVideoLocation()
    return HttpResponse(html)
    #return redirect('indexActies')

@login_required
def actieConvertVideo(request):
    if functions.getRunningStatus() == False:
        functions.ConvertingVideos()
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
    functions.insertConvertedVideos()
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

    functions.addVideo("Order SN3","video 7","NVR 41","Stadspark","Stadgenoot",videoLink)
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
