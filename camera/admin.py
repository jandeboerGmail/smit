from django.contrib import admin

from camera.models import Bedrijf, Gebruiker, Camera, Video, Log, Parameter

# Register your models here.
admin.site.register(Bedrijf)
admin.site.register(Gebruiker)
#admin.site.register(Wijk)
admin.site.register(Camera)
admin.site.register(Video)

admin.site.register(Log)
admin.site.register(Parameter)