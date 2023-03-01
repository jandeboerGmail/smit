from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.conf import settings
from django.db.models import Q
from django import forms
from operator import eq
from django.utils import timezone
from django.core.paginator import Paginator
from datetime import datetime
from django.core.mail import EmailMessage
from django.core import mail

import camera.functions as functions
from camera.models import Adress, Gebruiker, Bedrijf, Camera, Gebied, Locatie, Video ,ServiceOrder, Log, Parameter
from camera.forms import AdressForm, GebruikerForm, BedrijfForm, LocatieForm, CameraForm, OrderForm,  VideoForm, GebiedForm

#MFA
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import redirect, resolve_url
from django.views.decorators.cache import never_cache
from django.views.generic import FormView, TemplateView

from two_factor.views import OTPRequiredMixin
from two_factor.views.utils import class_view_decorator

import os,time,shutil,re,locale,xlwt

# Create your views here.
def current_datetime(request):
    now = datetime.now()
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
    return render(request,'index.html',{})

@login_required
@permission_required('camera.view_gebruiker')
def indexGebruiker(request):
    return render(request,'indexGebruiker.html', {} )

@login_required
@permission_required('camera.view_bedrijf')
def indexBedrijf(request):
    return render(request,'indexBedrijf.html', {} )

@login_required
@permission_required('camera.view_adress')
def indexAdres(request):
    return render(request,'indexAdres.html', {} )

@login_required
@permission_required('camera.view_gebied')
def indexGebied(request):
    return render(request,'indexGebied.html', {} )

@login_required
@permission_required('camera.view_locatie')
def indexLocatie(request):
    return render(request,'indexLocatie.html', {} )

@login_required
@permission_required('camera.view_camera')
def indexCamera(request):
    return render(request,'indexCamera.html', {} )

@login_required
@permission_required('camera.view_video')
def indexVideo(request):
    return render(request,'indexVideo.html', {} )

@login_required
@permission_required('camera.view_serviceorder')
def indexOrder(request):
    return render(request,'indexOrder.html', {} )

@login_required
@permission_required('camera.view_log')
def indexLog(request):
    return render(request,'indexLog.html', {} )

@login_required
def indexActies(request):
    return render(request,'indexActies.html', {} )

# User
@login_required
@permission_required('camera.view_video')
def indexUserVideo(request):
    return render(request,'indexUserVideo.html', {} )

@login_required
@permission_required('camera.view_serviceorder')
def indexUserOrder(request):
    return render(request,'indexUserOrder.html', {} )

@login_required
def indexUserActie(request):
    return render(request,'indexUserActie.html', {} )

@login_required
def indexStadgenoot(request):
    return render(request,'indexStadgenoot.html', {} )

# --- Gebruiker
@login_required
@permission_required('camera.view_gebruiker')
def allGebruiker(request):
    gebruiker_list = Gebruiker.objects.order_by('naam')
    aantal =  gebruiker_list.count
    gebruiker_dict  = {'results' : gebruiker_list , 'aantal' : aantal}
    return render(request,'displayGebruiker.html',gebruiker_dict )

# Zoek
@login_required
@permission_required('camera.view_gebruiker')
def zNaamGebruiker (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        gebruiker_list = Gebruiker.objects.filter(qset).distinct().order_by('soort','naam')
        aantal = gebruiker_list.count
        gebruiker_dict  = {'results' : gebruiker_list , 'aantal' : aantal, "query": query}
    else:
        gebruiker_dict = {}
    return render(request,'zNaamGebruiker.html', gebruiker_dict ) 

# Export
@login_required
@permission_required('camera.view_gebruiker')
def exportGebruiker(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
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
@permission_required('camera.add_gebruiker')
def createGebruiker(request):
    form = GebruikerForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = GebruikerForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Gebruiker Toevoegen'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.edit_gebuiker')
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
@permission_required('camera.delete_gebuiker')
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
@permission_required('camera.view_adress')
def allAdress(request):
    adress_list = Adress.objects.order_by('plaats','naam')
    aantal =  adress_list.count

    paginator = Paginator(adress_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    adress_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayAdress.html',adress_dict )

@login_required
@permission_required('camera.view_adress')
def zNaamAdress (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        adress_list = Adress.objects.filter(qset).distinct().order_by('naam')
        aantal = adress_list.count
        adress_dict  = {'results' : adress_list , 'aantal' : aantal, "query": query}
    else:
        adress_dict = {}
    return render(request,'zNaamAdress.html', adress_dict ) 

@login_required
@permission_required('camera.view_adress')
def zPlaatsAdress (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(plaats__icontains=query))       
        adress_list = Adress.objects.filter(qset).distinct().order_by('naam')
        aantal = adress_list.count

        paginator = Paginator(adress_list,12)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        adress_dict  = {'results' : adress_list , 'aantal' : aantal, "query": query}
    else:
        adress_dict = {}
    #return render(request,'displayAdress.html', adress_dict ) 
    return render(request,'zPlaatsAdress.html', adress_dict ) 

#CRUD
@login_required
@permission_required('camera.add_adress')
def createAdress(request):
    form = AdressForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = AdressForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Adres'}
    return render(request,template_name,context)


@login_required
@permission_required('camera.change_adress')
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
@permission_required('camera.delete_adress')
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
@permission_required('camera.view_bedrijf')
def allBedrijf(request):
    bedrijven_list = Bedrijf.objects.order_by('naam')
    aantal =  bedrijven_list.count
    bedrijf_dict  = {'bedrijven' : bedrijven_list , 'aantal' : aantal}
    return render(request,'displayBedrijf.html',bedrijf_dict )

# Zoek
@login_required
@permission_required('camera.view_bedrijf')
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
    return render(request,'zNaamBedrijf.html', bedrijf_dict ) 

@login_required
@permission_required('camera.view_bedrijf')
def zPlaatsBedrijf(request):
    query = request.GET.get('q','')
    if query:
        qset = ( Q(plaats__icontains=query))       
        bedrijf_list = Bedrijf.objects.filter(qset).distinct().order_by('naam')
        aantal = bedrijf_list.count
        bedrijf_dict  = {'results' : bedrijf_list , 'aantal' : aantal, "query": query}
    else:
        bedrijf_dict = {}
    return render(request,'zNaamBedrijf.html', bedrijf_dict ) 
    #return render(request,"zPlaatsBedrijf.html", bedrijf_dict)

#Export
@login_required
@permission_required('camera.view_bedrijf')
def exportBedrijf(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = time.now()
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
@permission_required('camera.add_bedrijf')
def createBedrijf(request):
    form = BedrijfForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = BedrijfForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Bedrijf Toevoegen'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.change_bedrijf')
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
@permission_required('camera.delete_bedrijf')
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

# --- Gebied -----------------
@login_required
@permission_required('camera.view_gebied')
def allGebied(request):
    aList = Gebied.objects.order_by('bedrijf','gebiedNr')
    aantal =  aList.count

    paginator = Paginator(aList,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    aDict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayGebied.html',aDict )

# Zoek

# Export
@login_required
@permission_required('camera.view_gebied')
def exportGebied(request):
        '''
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
        response['Content-Disposition']  = 'attachment; filename=Gebied_' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Gebied')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['bedrijf','gebiedNr','naam','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = Gebied.objects.order_by('bedrijf','gebiedNR').values_list('bedrijf.naam','gebiedNr','naam','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response
        '''

#CRUD
@login_required
@permission_required('camera.add_gebied')
def createGebied(request):
    form = GebiedForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = GebiedForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Gebied Toevoegen'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.change_gebied')
def editGebied(request,pk):
    try :
        gebied = Gebied.objects.get(id=pk)
    except Gebied.DoesNotExist:
        return redirect('indexGebied')

    form = GebiedForm(request.POST or None,instance = gebied)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('indexGebied'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Gebied'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.delete_gebied')
def deleteGebied(request,pk):
    try :
        gebied = Gebied.objects.get(id=pk)
    except Gebied.DoesNotExist:
        return redirect('/camera/indexGebied')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        gebied.delete()
        return ( redirect('/camera/indexGebied'))

    template_name = 'deleteRecord.html'
    context = {'item' : gebied , 'title': 'Verwijder Gebied'}
    return render(request,template_name,context)
                  
# --- Locatie -----------------
@login_required
@permission_required('camera.view_locatie')
def allLocatie(request):
    locatie_list = Locatie.objects.order_by('bedrijf','adres')
    aantal =  locatie_list.count

    paginator = Paginator(locatie_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    Locatie_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayLocatie.html',Locatie_dict )

# Zoek
@login_required
@permission_required('camera.view_locatie')
def zNaamLocatie (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        page_obj = Locatie.objects.filter(qset).distinct().order_by('bedrijf','adres')
        aantal = page_obj.count
        Locatie_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        Locatie_dict = {}
    return render(request,'zNaamLocatie.html', Locatie_dict ) 

# Export
@login_required
@permission_required('camera.view_locatie')
def exportLocatie(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
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
@permission_required('camera.add_locatie')
def createLocatie(request):
    form = LocatieForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = LocatieForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Locatie Toevoegen'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.change_locatie')
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
@permission_required('camera.delete_locatie')
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
@permission_required('camera.view_camera')
def allCamera(request):
    camera_list = Camera.objects.order_by('locatie','naam')
    aantal =  camera_list.count

    paginator = Paginator(camera_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    camera_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayCamera.html',camera_dict )
    
@login_required
@permission_required('camera.view_camera')
def allCameraStadgenoot(request):
    #camera__locatie__bedrijf__naam__
    camera_list = Camera.objects.filter(locatie__bedrijf__naam__icontains="Stadgenoot").select_related("locatie").order_by('locatie','naam')
    
    #camera_list = Camera.objects.order_by('locatie','naam')
    aantal =  camera_list.count

    paginator = Paginator(camera_list,12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    camera_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayCamera.html',camera_dict )

# Zoek
@login_required
@permission_required('camera.view_camera')
def zNaamCamera (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))       
        camera_list = Camera.objects.filter(qset).distinct().order_by('naam')
        aantal = camera_list.count
        camera_dict  = {'results' : camera_list , 'aantal' : aantal, "query": query}
    else:
        camera_dict = {}
    return render(request,'zNaamCamera.html', camera_dict ) 

@login_required
@permission_required('camera.view_camera')
def zLocatieCamera (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(locatie__naam__icontains=query))       
        camera_list = Camera.objects.filter(qset).distinct().order_by('locatie','naam')
        aantal = camera_list.count
        camera_dict  = {'results' : camera_list , 'aantal' : aantal, "query": query}
    else:
        camera_dict = {}
    return render(request,'zLocatieCamera.html', camera_dict ) 


# Export
@login_required
@permission_required('camera.view_camera')
def exportCamera(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
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
@permission_required('camera.add_camera')
def createCamera(request):
    form = CameraForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = CameraForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Camera'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.change_camera')
def editCamera(request,pk):
    try :
        camera = Camera.objects.get(id=pk)
    except Camera.DoesNotExist:
        #return redirect('indexCamera')
        return redirect('about')

    form = CameraForm(request.POST or None,instance = camera)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()

        return ( redirect('about'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Camera'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.delete_camera')
def deleteCamera(request,pk):
    try :
        camera = Camera.objects.get(id=pk)
    except Camera.DoesNotExist:
        return redirect('about')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        camera.delete()
        ##return ( redirect('/camera/indexCamera'))
        return redirect('about')

    template_name = 'deleteRecord.html'
    context = {'item' : camera , 'title': 'Verwijder Camera'}
    return render(request,template_name,context)

# ---- Video ---------------
@login_required
@permission_required('camera.view_video')
def allVideo(request):
    video_list = Video.objects.order_by('ordernr','naam','camera','-datum_updated')
    aantal =  video_list.count

    paginator = Paginator(video_list,15)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    video_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayVideo.html',video_dict )

@login_required
@permission_required('camera.view_video')
def allVideoBedrijf(request,bedrijf):
    qs1 = Video.objects.filter(camera__locatie__bedrijf__naam__icontains=bedrijf).select_related('camera').order_by("-datum_updated","ordernr","camera__locatie")
    #print ('qs1: ',str(qs1.query))
    aantal = qs1.count

    paginator = Paginator(qs1,15)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return dict

@login_required
@permission_required('camera.view_video')
def allVideoStadgenoot(request):
    bedrijf = 'Stadgenoot'
    dict = allVideoBedrijf(request, bedrijf)
    return render(request,'displayVideo.html',dict )

@login_required
@permission_required('camera.view_video')
def allVideoBerkhout(request):
    bedrijf = 'Berkhout'
    dict = allVideoBedrijf(request, bedrijf)
    return render(request,'displayVideo.html',dict )

@login_required
@permission_required('camera.view_video')
def allVideoSmit(request):
    bedrijf = 'Smit'
    dict = allVideoBedrijf(request, bedrijf)
    return render(request,'displayVideo.html',dict )

# Zoek
@login_required
@permission_required('camera.view_video')
def zNaamVideo (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))   
        qs1 = Video.objects.filter(qset).order_by('naam')
        #print ('qs1: ',str(qs1.query))
        aantal = qs1.count

        paginator = Paginator(qs1,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zNaamVideo.html', video_dict )

@login_required
@permission_required('camera.view_video')
def zOrderVideo (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(ordernr__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count

        paginator = Paginator(video_list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
     
        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zOrderVideo.html', video_dict )

@login_required
@permission_required('camera.view_video')
def zCameraVideo (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(camera__naam__icontains=query))    
        #qset = (Q(locatie__naam__icontains=query))   
        #qset = (Q(naam__icontains=query))  
        #video_list = Video.objects.filter(naam=videoNaam,camera__naam=cameraNaam)   
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count

        paginator = Paginator(video_list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
     
        video_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zCameraVideo.html', video_dict )

@login_required
@permission_required('camera.view_video')
def zLocatieVideo (request):
    query = request.GET.get('q','')    
    if query:
        qset = (Q(camera__locatie__naam__icontains=query))    
        video_list = Video.objects.filter(qset).select_related('camera').distinct().order_by('naam')
        print ('video_list: ',str(video_list.query))
        aantal = video_list.count

        paginator = Paginator(video_list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
          
        video_dict  = {'results' : video_list , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zLocatieVideo.html', video_dict ) 

# Export
@login_required
@permission_required('camera.view_video')
def exportVideo(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
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
@permission_required('camera.add_video')
def createVideo(request):
    form = VideoForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = VideoForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Video'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.edit_video')
def editVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('about')

    form = VideoForm(request.POST or None,instance = video)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('about'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Video'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.delete_video')
def deleteVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('about')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        video.delete()
        return ( redirect('about'))

    template_name = 'deleteRecord.html'
    context = {'item' : video , 'title': 'Verwijder Video'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.view_video')
def playVideo(request,pk):
    try :
        video = Video.objects.get(id=pk)
    except Video.DoesNotExist:
        return redirect('about')
    location =  functions.getVideoLocation() + video.video_link
    #location =  video.video_link
    video_dict  = {'location' : location , 'video' : video }
    return render(request,'playVideo.html', video_dict )
    '''
    template_name = 'playVideo.html'
    context = {'item' : video , 'title': 'Play Video'}
    return render(request,template_name,context)
    return ( redirect('indexVideo'))
    '''

# -----Orders ---
@login_required
@permission_required('camera.view_serviceorder')
def allOrder(request):
    list = ServiceOrder.objects.order_by('bedrijf','contact','ordernr')
    aantal =  list.count

    paginator = Paginator(list,15)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayOrder.html',dict )
'''
@login_required
def zNrOrder (request):
    query = request.GET.get('q','')

    if query:
        qset = (Q(ordernr__icontains=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('bedrijf','ordernr','contact')
        aantal = list.count

        paginator = Paginator(list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'zNrOrder.html', dict )
'''

@login_required
@permission_required('camera.view_serviceorder')
def zContactOrder (request):
    query = request.GET.get('q','')

    if query:
        qset = (Q(contact__naam__contains=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('contact','bedrijf','ordernr')
        aantal = list.count

        paginator = Paginator(list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        
        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'zContactOrder.html', dict )

# Export
@login_required
@permission_required('camera.view_serviceorder')
def exportOrder(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
        response['Content-Disposition']  = 'attachment; filename=ServiceOrder' + \
            now.strftime ("%Y%m%d_%H%M%S") +'.xls'

        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('ServiceOrder')
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        columns = ['ordernr','bedrijf','contact','memo']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)

        font_style = xlwt.XFStyle()

        rows = ServiceOrder.objects.order_by('ordernr').values_list('ordernr','bedrijf','contact','memo')
        for row in rows:
            row_num +=1

            for col_num in range(len(columns)):
                ws.write(row_num, col_num, str(row[col_num]), font_style)

        wb.save(response)
        return response

#CRUD
@login_required
@permission_required('camera.add_serviceorder')
def createOrder(request):
    form = OrderForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = OrderForm()
    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Toevoegen Service Order'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.change_serviceorder')
def editOrder(request,pk):
    try :
        order = ServiceOrder.objects.get(id=pk)
    except ServiceOrder.DoesNotExist:
        return redirect('about')

    form = OrderForm(request.POST or None,instance = order)
    # print('Request Method:',request.method)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return ( redirect('about'))

    template_name = 'inputForm.html'
    context = {'form' : form, 'title': 'Wijzig Service Order'}
    return render(request,template_name,context)

@login_required
@permission_required('camera.delete_serviceorder')
def deleteOrder(request,pk):
    try :
        order = ServiceOrder.objects.get(id=pk)
    except ServiceOrder.DoesNotExist:
        return redirect('about')

    if request.method == 'POST':
        #print('Deleting Post:',request.POST)
        order.delete()
        return ( redirect('about'))

    template_name = 'deleteRecord.html'
    context = {'item' : order , 'title': 'Verwijder Service Order'}
    return render(request,template_name,context)

# ---- Log ---------------
@login_required
@permission_required('camera.view_log')
def allLog(request):
    log_list = Log.objects.order_by('-id')
    aantal =  log_list.count

    paginator = Paginator(log_list,20)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    log_dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayAllLog.html',log_dict )

# Zoek
@login_required
@permission_required('camera.view_log')
def zOrderLog (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(ordernr__icontains=query))
     
        log_list = Log.objects.filter(qset).distinct().order_by('id')
        aantal = log_list.count
        log_dict  = {'results' : log_list , 'aantal' : aantal, "query": query}
    else:
        log_dict = {}
    return render(request,'zOrderLog.html', log_dict )

# Export
@login_required
@permission_required('camera.view_log')
def exportLog(request):
        response = HttpResponse(content_type='application/ms-excel')
        now = datetime.now()
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

@login_required
def actieConvertVideo(request):
    if functions.getRunningStatus() == False:
        functions.ConvertingVideos()
        html = "<html><body><strong><center>Conversie gestart... (check logs)</center></strong></body></html>" 
    else:
        html = "<html><body><strong><center>Niets te converteren(check status)</center></strong></body></html>" 
    return HttpResponse(html)

@login_required
def actieConvertVideoOrder(request):
    if functions.getRunningStatus() == False:
        order = functions.getOrder()
        functions.ConvertingVideosOrder(order)
        html = "<html><body><strong><center>Order conversie gestart... (check logs)</center></strong></body></html>" 
    else:
        html = "<html><body><strong><center>Niets te converteren(check status)</center></strong></body></html>" 
    return HttpResponse(html)

@login_required
def actieListVideo(request):
    functions.ListVideos()
    html = "<html><body><strong><center>Listing video's Done.. (check logs) </center></strong></body></html>" 
    return HttpResponse(html)
    #return redirect('indexActies')

@login_required
def actieListConvertedVideo(request):
    functions.ListConvertedVideos()
    html = "<html><body><strong><center>Listing Converted video's Done.. (check logs) </center></strong></body></html>" 
    return HttpResponse(html)
    #return redirect('indexActies')

'''
@login_required
def actieConvertVideoOrder(request):
    # TODO 
    context  = {}
    return render(request,'todo.html',context )    
'''
    

@login_required
def actieInsertConvertedVideos(request):
    functions.insertConvertedVideos()
    return redirect('indexActies')

@login_required
def actieAddVideo(request):
    videoLink = "Default/earth.mp4"

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

@login_required
def actieSendMail(request):

    recipients = ['jandeboer@gmail.com','eenwestßmail.com','eenwest@gmail.com']
  
    functions.SendMail('My subject',"Test Message3",recipients)
    return HttpResponse("Mail send!!")
    #return redirect('redirect to a new page')

@login_required
def actieDisplayPermissions(request):
    context  = {}
    return render(request,'displayPermissions.html',context )

#stadgenoot Video
# Zoek

'''
@login_required
def zNaamVideoStadgenoot (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(naam__icontains=query))   

        #qs1 = Video.objects.filter(camera__locatie__bedrijf__naam__icontains="Stadgenoot").select_related('camera')
        qs1 = Video.objects.filter(qset)
        #qs1 = qs2 | qs3
        aantal = qs1.count
        print ('qs1: ',str(qs1.query))
        print ('aantal: ',aantal)

        paginator = Paginator(qs1,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zNaamVideo.html', video_dict )
'''

@login_required
@permission_required('camera.view_video')
def zNaamVideoStadgenoot (request):
    query = request.GET.get('q','')
    print('query: ',query)
    if query:
        print ('query: ',query)
        qset = (Q(naam__icontains=query))   
        qs1 = Video.objects.filter(qset).order_by('naam')
        print ('qs1: ',str(qs1.query))
        aantal = qs1.count

        paginator = Paginator(qs1,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zNaamVideo.html', video_dict )

@login_required
@permission_required('camera.view_video')
def zOrderVideoStadgenoot (request):
    query = request.GET.get('q','')
    if query:
        qset = (Q(ordernr__icontains=query))       
        video_list = Video.objects.filter(qset).distinct().order_by('naam')
        aantal = video_list.count

        paginator = Paginator(video_list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
     
        video_dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        video_dict = {}
    return render(request,'zOrderVideo.html', video_dict )

@login_required
@permission_required('camera.view_serviceorder')
def allOrderStadgenoot(request):
    list = ServiceOrder.objects.filter(bedrijf__naam__icontains="Stadgenoot").select_related("bedrijf").order_by('ordernr','contact')
    aantal =  list.count

    paginator = Paginator(list,15)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    dict  = {'page_obj' : page_obj , 'aantal' : aantal}
    return render(request,'displayOrder.html',dict )

@login_required
@permission_required('camera.view_serviceorder')
def zNrOrderStadgenoot (request):
    query = request.GET.get('q','')
    query = 'a'
    if query:
        qset = (Q(ordernr__icontains=query))
        qs1 = ServiceOrder.objects.filter(qset).distinct().order_by('bedrijf','ordernr','contact')

        #qs1 = ServiceOrder.objects.filter(bedrijf__naam__icontains="Stadgenoot").select_related("bedrijf").order_by('ordernr','contact')       
        
        #qs1 = ServiceOrder.objects.filter(bedrijf__naam__icontains="Stadgenoot").select_related("bedrijf").order_by('ordernr')
        #qs1 = Video.objects.filter(camera__locatie__bedrijf__naam__icontains="Stadgenoot").select_related('camera')
        aantal = qs1.count
        print ('qs1: ',str(qs1.query))
        print("aantal: ", aantal)

        paginator = Paginator(qs1,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'zNrOrder.html', dict )

@login_required
@permission_required('camera.view_serviceorder')
def zNrOrder (request):
    query = request.GET.get('q','')

    if query:
        qset = (Q(ordernr__icontains=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('bedrijf','ordernr','contact')
        aantal = list.count

        paginator = Paginator(list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'zNrOrder.html', dict )

@login_required
@permission_required('camera.view_serviceorder')
def zContactOrderStadgenoot (request):
    query = request.GET.get('q','')
    query = 'a'
    if query:
        qset = (Q(contact__naam__contains=query))       
        list = ServiceOrder.objects.filter(qset).distinct().order_by('contact','bedrijf','ordernr')
        aantal = list.count

        paginator = Paginator(list,15)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        
        dict  = {'page_obj' : page_obj , 'aantal' : aantal, "query": query}
    else:
        dict = {}
    return render(request,'zContactOrder.html', dict )

# MFA
class HomeView(TemplateView):
    template_name = 'home.html'

class RegistrationView(FormView):
    template_name = 'registration.html'
    form_class = UserCreationForm

    def form_valid(self, form):
        form.save()
        return redirect('registration_complete')

class RegistrationCompleteView(TemplateView):
    template_name = 'registration_complete.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['login_url'] = resolve_url(settings.LOGIN_URL)
        return context

@class_view_decorator(never_cache)
class ExampleSecretView(OTPRequiredMixin, TemplateView):
    template_name = 'secret.html'
   