from django.contrib import admin
from django.contrib.auth.models import User
from django.contrib.auth.admin  import UserAdmin 

from camera.models import Adress,  Bedrijf, Account, Camera, Video, Log, Parameter, Locatie, Gebied, ServiceOrder

# Register your models here.
admin.site.register(Adress)
admin.site.register(Bedrijf)
admin.site.register(Locatie)
admin.site.register(Gebied)
admin.site.register(Camera)
admin.site.register(Video)
admin.site.register(ServiceOrder)
admin.site.register(Log)
admin.site.register(Parameter)

class AccountInline(admin.StackedInline):
    model = Account
    can_delete = False
    verbose_name_plural = "Accounts"

class CustomizedUserAdmin (UserAdmin):
    Inlines = (AccountInline,)

admin.site.unregister(User)
admin.site.register(User, CustomizedUserAdmin)

admin.site.register(Account)