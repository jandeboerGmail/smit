from django.urls import path
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('time/',views.current_datetime,name='current_datetime'),
    path('about/',views.about,name='about'),
    path('todo/',views.todo,name='todo'),

#Index  
    path('',views.index,name='index'),
    path('zoekVideo',views.zoekVideo,name='zoekVideo'),

    path('indexGebruiker',views.indexGebruiker,name='indexGebruiker'),
    path('indexAdres',views.indexAdres,name='indexAdres'),
    path('indexBedrijf',views.indexBedrijf,name='indexBedrijf'),
    path('indexLocatie',views.indexLocatie,name='indexLocatie'),
    path('indexCamera',views.indexCamera,name='indexCamera'),
    path('indexVideo',views.indexVideo,name='indexVideo'),
    path('indexLog',views.indexLog,name='indexLog'),
    path('indexActies',views.indexActies,name='indexActies'),

# Gebruiker
    path('allGebruiker/',views.allGebruiker,name='allGebruiker'),
    path('zNaamGebruiker/',views.zNaamGebruiker,name='zNaamGebruiker'),
    path('exportGebruiker/',views.exportGebruiker,name='exportGebruiker'),
    path('createGebruiker/',views.createGebruiker,name='createGebruiker'),
    path('editGebruiker/<int:pk>',views.editGebruiker,name='editGebruiker'),
    path('deleteGebruiker/<int:pk>',views.deleteGebruiker,name='deleteGebruiker'),

# Adresss
    path('allAdress/',views.allAdress,name='allAdress'),
    path('zNaamAdress/',views.zNaamAdress,name='zNaamAdress'),
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
    path('exportCamera/',views.exportCamera,name='exportCamera'),
    path('createCamera/',views.createCamera,name='createCamera'),
    path('editCamera/<int:pk>',views.editCamera,name='editCamera'),
    path('deleteCamera/<int:pk>',views.deleteCamera,name='deleteCamera'),

# Video
    path('allVideo/',views.allVideo,name='allVideo'),
    path('zNaamVideo/',views.zNaamVideo,name='zNaamVideo'),
    path('zOrderVideo/',views.zOrderVideo,name='zOrderVideo'),
    path('exportVideo/',views.exportVideo,name='exportVideo'),
    path('createVideo/',views.createVideo,name='createVideo'),
    path('editVideo/<int:pk>',views.editVideo,name='editVideo'),
    path('deleteVideo/<int:pk>',views.deleteVideo,name='deleteVideo'),

    path('playVideo/<int:pk>',views.playVideo,name='playVideo'),
    path('convertVideo/<int:pk>',views.convertVideo,name='convertVideo'),
    path('downloadVideo/<int:pk>',views.downloadVideo,name='downloadVideo'),

# Log
    path('allLog/',views.allLog,name='allLog'),
    path('zOrderLog/',views.zOrderLog,name='zOrderLog'),
    path('exportLog/',views.exportLog,name='exportLog'),

# Akcties
    path('actieDisplayConversionStatus/',views.actieDisplayConversionStatus,name='actieDisplayConversionStatus'),
    path('actieToggleConversionStatus/',views.actieToggleConversionStatus,name='actieToggleConversionStatus'),
    path('actieGetVideoLocation/',views.actieGetVideoLocation,name='actieGetVideoLocation'),
    path('actieConvertVideo/',views.actieConvertVideo,name='actieConvertVideo'),
    path('actieConvertVideoOrder/',views.actieConvertVideoOrder,name='actieConvertVideoOrder'),
    path('actieAddVideo/',views.actieAddVideo,name='actieAddVideo'),
    path('insertConvertedVideos/',views.insertConvertedVideos,name='insertConvertedVideos'),

]
