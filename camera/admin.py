from django.contrib import admin
from camera.models import Bedrijf, Wijk, Gebruiker, Camera, Video

# Register your models here.
admin.site.register(Bedrijf)
admin.site.register(Gebruiker)
admin.site.register(Wijk)
admin.site.register(Camera)
admin.site.register(Video)