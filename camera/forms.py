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
            'plaats': forms.Select(attrs={'class': 'form-control'}),
            'land': forms.Textarea(attrs={'class': 'form-control'}),
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

        fields = ['naam','telefoon','email','website','image','telefoon','memo'] 
        
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            #adress
            'telefoon': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),  
            'website': forms.URLInput(attrs={'class': 'form-control'}),
            'image': forms.FileInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }
'''
class WijkForm(forms.ModelForm):
    class Meta:
        model = Wijk

        fields = ['naam','bedrijf','plaats','contact','memo'] 
        
        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'plaats': forms.TextInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }
'''
     

class CameraForm(forms.ModelForm):
    class Meta:
        model = Camera

        fields = ['naam','memo']

        widgets = {
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
            'memo': forms.Textarea(attrs={'class': 'form-control'}),
        }

class VideoForm(forms.ModelForm):
    class Meta:
        model = Video

        fields = ['ordernr','naam','camera','opname_van','opname_tot','video_link','codec','memo']

        widgets = {
            'ordernr': forms.TextInput(attrs={'class': 'form-control'}),
            'naam': forms.TextInput(attrs={'class': 'form-control'}),
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