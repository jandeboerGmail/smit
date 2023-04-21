from django.urls import path
from . import views

from django.conf import settings
from django.conf.urls.static import static

#MFA
from django.contrib import admin
from django.contrib.auth.views import LogoutView
from django.urls import include, path

from two_factor.gateways.twilio.urls import urlpatterns as tf_twilio_urls
from two_factor.urls import urlpatterns as tf_urls

from .views import (
    ExampleSecretView, HomeView, RegistrationCompleteView, RegistrationView, 
)

urlpatterns = [
    path('/camera/', views.allowedVideo, name='camera'),
    path('allowedVideo/', views.allowedVideo, name='allowedVideo'),
    path('time/',views.current_datetime,name='current_datetime'),
    path('about/',views.about,name='about'),
    path('todo/',views.todo,name='todo'),
    #path('playVideo/', playVideo, name='video_player'),
   

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
    path('indexUserActie',views.indexUserActie,name='indexUserActie'),

#stadgenoot
    path('indexStadgenoot',views.indexStadgenoot,name='indexStadgenoot'),
    path('allVideoStadgenoot',views.allVideoStadgenoot,name='allVideoStadgenoot'),
    path('zVideoStadgenootNaam',views.zVideoStadgenootNaam,name='zVideoStadgenootNaam'),
    path('zVideoStadgenootLocatie',views.zVideoStadgenootLocatie,name='zVideoStadgenootLocatie'), 
    #path('zVideoStadgenootOrder',views.zVideoStadgenootOrder,name='zVideoStadgenootOrder'),
    path('allOrderStadgenoot',views.allOrderStadgenoot,name='allOrderStadgenoot'),
    path('zOrderStadgenootNr',views.zOrderStadgenootNr,name='zOrderStadgenootNr'),
    path('zOwnOrderStadgenoot',views.zOwnOrderStadgenoot,name='zOwnOrderStadgenoot'),
    path('allCameraStadgenoot',views.allCameraStadgenoot,name='allCameraStadgenoot'),
    path('zCameraStadgenootNaam',views.zCameraStadgenootNaam,name='zCameraStadgenootNaam'),
    path('zCameraStadgenootLocatie',views.zCameraStadgenootLocatie,name='zCameraStadgenootLocatie'),

#Berkhout
    #path('indexBerkhout',views.indexBerkhout,name='indexBerkhout'),
    path('allVideoBerkhout',views.allVideoBerkhout,name='allVideoBerkhout'),
    path('zVideoBerkhoutNaam',views.zVideoBerkhoutNaam,name='zVideoBerkhoutNaam'),
    path('zVideoBerkhoutLocatie',views.zVideoBerkhoutLocatie,name='zVideoBerkhoutLocatie'), 
    #path('zVideoBerkhoutOrder',views.zVideoBerkhoutOrder,name='zVideoBerkhoutOrder'),
    path('allOrderBerkhout',views.allOrderBerkhout,name='allOrderBerkhout'),
    path('zOrderBerkhoutNr',views.zOrderBerkhoutNr,name='zOrderBerkhoutNr'),
    path('zOwnOrderBerkhout',views.zOwnOrderBerkhout,name='zOwnOrderBerkhout'),
    path('allCameraBerkhout',views.allCameraBerkhout,name='allCameraBerkhout'),
    path('zCameraBerkhoutNaam',views.zCameraBerkhoutNaam,name='zCameraBerkhoutNaam'),
    path('zCameraBerkhoutLocatie',views.zCameraBerkhoutLocatie,name='zCameraBerkhoutLocatie'),

#Smit
    #path('indexSmit',views.indexSmit,name='indexSmit'),
    path('allVideoSmit',views.allVideoSmit,name='allVideoSmit'),
    path('zVideoSmitNaam',views.zVideoSmitNaam,name='zVideoSmitNaam'),
    path('zVideoSmitLocatie',views.zVideoSmitLocatie,name='zVideoSmitLocatie'), 
    #path('zVideoSmitOrder',views.zVideoSmitOrder,name='zVideoSmitOrder'),
    path('allOrderSmit',views.allOrderSmit,name='allOrderSmit'),
    path('zOrderSmitNr',views.zOrderSmitNr,name='zOrderSmitNr'),
    path('zOwnOrderSmit',views.zOwnOrderSmit,name='zOwnOrderSmit'),
    path('allCameraSmit',views.allCameraSmit,name='allCameraSmit'),
    path('zCameraSmitNaam',views.zCameraSmitNaam,name='zCameraSmitNaam'),
    path('zCameraSmitLocatie',views.zCameraSmitLocatie,name='zCameraSmitLocatie'),

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

    path('allowedVideo/',views.allowedVideo,name='allowedVideo'),


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
    
#MFA
    path( '', HomeView.as_view(),name='home',),
    path('account/logout/',LogoutView.as_view(),name='logout',),
    path('secret/',ExampleSecretView.as_view(),name='secret',),
    path('account/register/',RegistrationView.as_view(),name='registration',),
    path('account/register/done/',RegistrationCompleteView.as_view(),name='registration_complete',),
    
    path('', include(tf_urls)),
    path('', include(tf_twilio_urls)),
    #path('', include('user_sessions.urls', 'user_sessions')),
    path('admin/', admin.site.urls),

]   + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

'''
if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        path('__debug__/', include(debug_toolbar.urls)),
    ]
'''



