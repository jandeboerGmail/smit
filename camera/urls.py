from django.urls import path, include
from . import views

from django.conf import settings
from django.conf.urls.static import static
from django.views.generic.base import TemplateView

#from django.contrib.staticfiles.urls import staticfiles_urlpatterns

#MFA
from django.contrib import admin
from django.contrib.auth.views import LogoutView
from django.urls import include, path
#mfa
from django.contrib.auth.views import LoginView as AuthLoginView
#from two_factor.views import LoginViewMixin

#from two_factor.gateways.twilio.urls import urlpatterns as tf_twilio_urls
#from two_factor.urls import urlpatterns as tf_urls

#from .views import (
#   ExampleSecretView, HomeView, RegistrationCompleteView, RegistrationView, 
#)

urlpatterns = [
    #path('/camera/', views.allowedVideo, name='camera'),
    #path('allowedVideo/', views.allowedVideo, name='allowedVideo'),
    path('time/',views.current_datetime,name='current_datetime'),
    path('about/',views.about,name='about'),
    path('activateMFA/',views.activateMFA,name='activateMFA'),
    path('privacy/',views.privacy,name='privacy'),
    path('todo/',views.todo,name='todo'),

#Index  
    path('',views.index,name='index'),
    path('indexAdres',views.indexAdres,name='indexAdres'),
    path('indexBedrijf',views.indexBedrijf,name='indexBedrijf'),
    path('indexGebied',views.indexGebied,name='indexGebied'),
    path('indexLocatie',views.indexLocatie,name='indexLocatie'),
    path('indexLocatie',views.indexLocatie,name='indexLocatie'),
    path('indexCamera',views.indexCamera,name='indexCamera'),
    path('indexVideo',views.indexVideo,name='indexVideo'),
    path('indexOrder',views.indexOrder,name='indexOrder'),
    path('indexLog',views.indexLog,name='indexLog'),
    path('indexActies',views.indexActies,name='indexActies'),

#User
    path('indexUserVideo',views.indexUserVideo,name='indexUserVideo'),
    path('indexUserOrder',views.indexUserOrder,name='indexUserOrder'),
   
    path('allVideoUser',views.allVideoUser,name='allVideoUser'),
    path('zNaamVideoUser',views.zNaamVideoUser,name='zNaamVideoUser'),
    path('zLocatieVideoUser',views.zLocatieVideoUser,name='zLocatieVideoUser'),

    path('allCameraUser',views.allCameraUser,name='allCameraUser'),
    path('zNaamCameraUser',views.zNaamCameraUser,name='zNaamCameraUser'),
    path('zLocatieCameraUser',views.zLocatieCameraUser,name='zLocatieCameraUser'),

    path('allOrderUser',views.allOrderUser,name='allOrderUser'),
    path('zOrderUserNr',views.zOrderUserNr,name='zOrderUserNr'),
    path('zOwnOrderUser',views.zOwnOrderUser,name='zOwnOrderUser'),

# Adresss
    path('allAdress/',views.allAdress,name='allAdress'),
    path('zNaamAdress/',views.zNaamAdress,name='zNaamAdress'),
    path('zPlaatsAdress/',views.zPlaatsAdress,name='zPlaatsAdress'),
    path('createAdress/',views.createAdress,name='createAdress'),
    path('editAdress/<int:pk>',views.editAdress,name='editAdress'),
    path('deleteAdress/<int:pk>',views.deleteAdress,name='deleteAdress'),

# Bedrijf
    path('allBedrijf/',views.allBedrijf,name='allBedrijf'),
    path('zNaamBedrijf/',views.zNaamBedrijf,name='zNaamBedrijf'),
    path('zPlaatsBedrijf/',views.zPlaatsBedrijf,name='zPlaatsBedrijf'),
	path('exportBedrijf/',views.exportBedrijf,name='exportBedrijf'),
    path('createBedrijf/',views.createBedrijf,name='createBedrijf'),
    path('editBedrijf/<int:pk>',views.editBedrijf,name='editBedrijf'),
    path('deleteBedrijf/<int:pk>',views.deleteBedrijf,name='deleteBedrijf'),

# Gebied
    path('allGebied/',views.allGebied,name='allGebied'),
    #path('zNaamGebied/',views.zNaamGebied,name='zNaamGebied'),
    path('exportGebied/',views.exportGebied,name='exportGebied'),
    path('createGebied/',views.createGebied,name='createGebied'),
    path('editGebied/<int:pk>',views.editGebied,name='editGebied'),
    path('deleteGebied/<int:pk>',views.deleteGebied,name='deleteGebied'),
    
# Locatie
    path('allLocatie/',views.allLocatie,name='allLocatie'),
    path('zNaamLocatie/',views.zNaamLocatie,name='zNaamLocatie'),
    path('exportLocatie/',views.exportLocatie,name='exportLocatie'),
    path('createLocatie/',views.createLocatie,name='createLocatie'),
    path('editLocatie/<int:pk>',views.editLocatie,name='editLocatie'),
    path('deleteLocatie/<int:pk>',views.deleteLocatie,name='deleteLocatie'),

# Camera
    path('allCamera/',views.allCamera,name='allCamera'),
    path('zNaamCamera/',views.zNaamCamera,name='zNaamCamera'),
    path('zLocatieCamera/',views.zLocatieCamera,name='zLocatieCamera'),
    path('exportCamera/',views.exportCamera,name='exportCamera'),
    path('createCamera/',views.createCamera,name='createCamera'),
    path('editCamera/<int:pk>',views.editCamera,name='editCamera'),
    path('deleteCamera/<int:pk>',views.deleteCamera,name='deleteCamera'),

# Video
    path('allVideo/',views.allVideo,name='allVideo'),
    path('allowedVideo/',views.allowedVideo,name='allowedVideo'),

    path('allVideoStadgenoot/',views.allVideoStadgenoot,name='allVideoStadgenoot'),
    path('allVideoSmit/',views.allVideoSmit,name='allVideoSmit'),
    path('allVideoBerkhout/',views.allVideoBerkhout,name='allVideoBerkhout'),

    path('zNaamVideo/',views.zNaamVideo,name='zNaamVideo'),
    path('zOrderVideo/',views.zOrderVideo,name='zOrderVideo'),
    path('zCameraVideo/',views.zCameraVideo,name='zCameraVideo'),
    path('zLocatieVideo/',views.zLocatieVideo,name='zLocatieVideo'),
    path('exportVideo/',views.exportVideo,name='exportVideo'),
    path('createVideo/',views.createVideo,name='createVideo'),
    path('editVideo/<int:pk>',views.editVideo,name='editVideo'),
    path('deleteVideo/<int:pk>',views.deleteVideo,name='deleteVideo'),

    path('playVideo/<int:pk>',views.playVideo,name='playVideo'),

# Order
    path('allOrder/',views.allOrder,name='allOrder'),
    path('zNrOrder/',views.zNrOrder,name='zNrOrder'),
    path('zContactOrder/',views.zContactOrder,name='zContactOrder'),
    
    path('exportOrder/',views.exportOrder,name='exportOrder'),
    path('createOrder/',views.createOrder,name='createOrder'),
    path('editOrder/<int:pk>',views.editOrder,name='editOrder'),
    path('deleteOrder/<int:pk>',views.deleteOrder,name='deleteOrder'),

# Log
    path('allLog/',views.allLog,name='allLog'),
    path('zOrderLog/',views.zOrderLog,name='zOrderLog'),
    path('exportLog/',views.exportLog,name='exportLog'),

# Acties
    path('actieDisplayConversionStatus/',views.actieDisplayConversionStatus,name='actieDisplayConversionStatus'),
    path('actieToggleConversionStatus/',views.actieToggleConversionStatus,name='actieToggleConversionStatus'),
    path('actieGetVideoLocation/',views.actieGetVideoLocation,name='actieGetVideoLocation'),
    path('actieSendMail/',views.actieSendMail,name='actieSendMail'),
    path('actieDisplayPermissions/',views.actieDisplayPermissions,name='actieDisplayPermissions'),
    path('actieConvertVideo/',views.actieConvertVideo,name='actieConvertVideo'),
    path('actieListVideo/',views.actieListVideo,name='actieListVideo'),
    path('actieListConvertedVideo/',views.actieListConvertedVideo,name='actieListConvertedVideo'),
    path('actieConvertVideoOrder/',views.actieConvertVideoOrder,name='actieConvertVideoOrder'),
    path('actieAddVideo/',views.actieAddVideo,name='actieAddVideo'),
    path('actieInsertConvertedVideos/',views.actieInsertConvertedVideos,name='actieInsertConvertedVideos'),
    path('actieMakeImages/',views.actieMakeImages,name='actieMakeImages'),
    path('actieGetDurationAndFileSizeVideos/',views.actieGetDurationAndFileSizeVideos,name='actieGetDurationAndFileSizeVideos'),

#Authenticate
    #path ('accounts/', include('django.contrib.auth.urls')),
 
#MFA

   # path('login/', CustomLoginView.as_view(), name='login'),

   # path( '', HomeView.as_view(),name='home',),
   # path('account/logout/',LogoutView.as_view(),name='logout',),
   # path('secret/',ExampleSecretView.as_view(),name='secret',),
   # path('account/register/done/',RegistrationCompleteView.as_view(),name='registration_complete',),

   # path('', include(tf_urls)),
    #path('', include(tf_twilio_urls)),
    
    #path('', include('user_sessions.urls', 'user_sessions')),
    #path('admin/', admin.site.urls),
    #path('', include('smit.urls'))

]  + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


