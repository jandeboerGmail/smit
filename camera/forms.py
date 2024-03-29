from re import L
from django import forms
# from .widgets import DateTimePickerInput
from .models import Adress, Bedrijf, Locatie, Camera, Video, ServiceOrder, Gebied 

#Adress
class AdressForm(forms.ModelForm):
    class Meta:
        model = Adress
        fields = ['naam','straat','postcode','plaats','land']  
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'straat': forms.TextInput(attrs={'class': 'form-control'}),
            'postcode': forms.TextInput(attrs={'class': 'form-control'}),
            'plaats': forms.TextInput(attrs={'class': 'form-control'}),
            'land': forms.TextInput(attrs={'class': 'form-control'}),
        }

# Bedrijf
class BedrijfForm(forms.ModelForm):
    class Meta:
        model = Bedrijf
        fields = ['naam','adres','telefoon','email','website','image','telefoon','memo'] 
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'adres': forms.Select(attrs={'class': 'form-control'}),
            'telefoon': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),  
            'website': forms.URLInput(attrs={'class': 'form-control'}),
            'image': forms.FileInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

# locatie
class LocatieForm(forms.ModelForm):
    class Meta:
        model = Locatie
        fields = ['naam','adres','bedrijf','gebied','contact','image','memo'] 
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'bedrijf': forms.Select(attrs={'class': 'form-control'}),
            'adres': forms.Select(attrs={'class': 'form-control'}),
            'gebied': forms.Select(attrs={'class': 'form-control'}),
            'contact': forms.Select(attrs={'class': 'form-control'}),
            'image': forms.FileInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }
     
class CameraForm(forms.ModelForm):
    class Meta:
        model = Camera
        fields = ['naam','locatie','type','plaats','gps_locatie','datum_geplaatst','memo']
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'locatie': forms.Select(attrs={'class': 'form-control'}),
            'type': forms.TextInput(attrs={'class': 'form-control'}),        
            'plaats': forms.TextInput(attrs={'class': 'form-control'}),
            'gps': forms.TextInput(attrs={'class': 'form-control'}),
            'datum_geplaats': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

#
class VideoForm(forms.ModelForm):
    class Meta:
        model = Video
        fields = ['naam','camera','opname_van','opname_tot','video_link','video_image','codec','memo']
        widgets = {
           # 'ordernr': forms.TextInput(attrs={'class': 'form-control'}),
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'camera': forms.Select(attrs={'class': 'form-control'}),
            #'opname_van': forms.SplitDateTimeWidget(),
            'opname_van': forms.DateTimeInput(attrs={'class': 'form-control'}), 
            'opname_tot': forms.DateTimeInput(attrs={'class': 'form-control'}),   
            'video_link': forms.TextInput(attrs={'class': 'form-control'}), 
            'video_image': forms.TextInput(attrs={'class': 'form-control'}), 
            'codec': forms.TextInput(attrs={'class': 'form-control'}), 
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

class OrderForm(forms.ModelForm):
    class Meta:
        model = ServiceOrder
        fields = ['ordernr','bedrijf','contact','opdrachtnummer','locatie','opened_date','closed_date','memo']
        widgets = {
            'ordernr': forms.TextInput(attrs={'class': 'form-control'}),
            'bedrijf': forms.Select(attrs={'class': 'form-control'}),
            'contact': forms.Select(attrs={'class': 'form-control'}),
            'opdrachtnummer': forms.TextInput(attrs={'class': 'form-control'}),
            'locatie': forms.Select(attrs={'class': 'form-control'}),
            # 'opened' : forms.SplitDateTimeWidget(),
            # '#closed' : forms.SelectDateWidget(),
             #'opened' : forms.DateTimePickerInput(attrs={'class': 'form-control'}),
            #'closed' : forms.DateTimePickerInput(attrs={'class': 'form-control'}),
            #'keep_original': forms.CheckboxInput(),
            #'auto_cleanup': forms.CheckboxInput(),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

class GebiedForm(forms.ModelForm):
     class Meta: 
        model = Gebied
        fields = ['gebiedNr','bedrijf','naam','image','memo']
        widgets = {
            'gebiedNr': forms.NumberInput(attrs={'class': 'form-control'}),
            'bedrijf': forms.Select(attrs={'class': 'form-control'}),
            'naam': forms.TextInput(attrs={'class': 'form-control'}),             
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }                 