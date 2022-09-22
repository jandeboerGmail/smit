from re import L
from django import forms
from .models import Adress, Gebruiker, Bedrijf, Locatie, Camera, Video

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

# Gebruiker
class GebruikerForm(forms.ModelForm):
    class Meta:
        model = Gebruiker

        fields = ['naam','user','soort','email','telefoon','memo'] 
        
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'user': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),  
            'telefoon': forms.TextInput(attrs={'class': 'form-control'}),
            'soort': forms.Select(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
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

        fields = ['naam','adres','bedrijf','contact','image','memo'] 
        
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'adres': forms.Select(attrs={'class': 'form-control'}),
            'bedrijf': forms.Select(attrs={'class': 'form-control'}),
            'contact': forms.Select(attrs={'class': 'form-control'}),
            'image': forms.FileInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }
     
class CameraForm(forms.ModelForm):
    class Meta:
        model = Camera

        fields = ['naam','locatie','type','gps_locatie','datum_geplaatst','memo']
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'locatie': forms.Select(attrs={'class': 'form-control'}),
            'type': forms.TextInput(attrs={'class': 'form-control'}),
            'gps_locatie': forms.TextInput(attrs={'class': 'form-control'}), 
            'datum_geplaatst': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

class VideoForm(forms.ModelForm):
    class Meta:
        model = Video
   
        fields = ['ordernr','naam','camera','opname_van','opname_tot','video_link','codec','memo']

        widgets = {
            'ordernr': forms.TextInput(attrs={'class': 'form-control'}),
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'camera': forms.Select(attrs={'class': 'form-control'}),
            'opname_van': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'opname_tot': forms.DateTimeInput(attrs={'class': 'form-control'}),   
            #'video_image': forms.FileInput(attrs={'class': 'form-control'}), 
            'video_link': forms.TextInput(attrs={'class': 'form-control'}), 
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

class ZoekVideoForm(forms.ModelForm):
    class Meta:
        model = Video
        fields = (['ordernr','naam','camera','opname_van','opname_tot','video_link','codec','memo'])

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['camera'].queryset = Camera.objects.none()