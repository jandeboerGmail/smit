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
    path('indexBedrijf',views.indexBedrijf,name='indexBedrijf'),
    path('indexWijk',views.indexWijk,name='indexWijk'),
    path('indexCamera',views.indexCamera,name='indexCamera'),
    path('indexVideo',views.indexVideo,name='indexVideo'),
    path('indexAkties',views.indexAkties,name='indexAkties'),

# Gebruiker
    path('allGebruiker/',views.allGebruiker,name='allGebruiker'),
    path('zNaamGebruiker/',views.zNaamGebruiker,name='zNaamGebruiker'),
    path('exportGebruiker/',views.exportGebruiker,name='exportGebruiker'),
    path('createGebruiker/',views.createGebruiker,name='createGebruiker'),
    path('editGebruiker/<int:pk>',views.editGebruiker,name='editGebruiker'),
    path('deleteGebruiker/<int:pk>',views.deleteGebruiker,name='deleteGebruiker'),

# Bedrijf
    path('allBedrijf/',views.allBedrijf,name='allBedrijf'),
    path('zNaamBedrijf/',views.zNaamBedrijf,name='zNaamBedrijf'),
    path('zPlaatsBedrijf/',views.zPlaatsBedrijf,name='zPlaatsBedrijf'),
	path('exportBedrijf/',views.exportBedrijf,name='exportBedrijf'),
    path('createBedrijf/',views.createBedrijf,name='createBedrijf'),
    path('editBedrijf/<int:pk>',views.editBedrijf,name='editBedrijf'),
    path('deleteBedrijf/<int:pk>',views.deleteBedrijf,name='deleteBedrijf'),


# Wijk
    path('allWijk/',views.allWijk,name='allWijk'),
    path('zNaamWijk/',views.zNaamWijk,name='zNaamWijk'),
    path('exportWijk/',views.exportWijk,name='exportWijk'),
    path('createWijk/',views.createWijk,name='createWijk'),
    path('editWijk/<int:pk>',views.editWijk,name='editWijk'),
    path('deleteWijk/<int:pk>',views.deleteWijk,name='deleteWijk'),


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
    path('exportVideo/',views.exportVideo,name='exportVideo'),
    path('createVideo/',views.createVideo,name='createVideo'),
    path('editVideo/<int:pk>',views.editVideo,name='editVideo'),
    path('deleteVideo/<int:pk>',views.deleteVideo,name='deleteVideo'),

    path('playVideo/<int:pk>',views.playVideo,name='playVideo'),
    path('convertVideo/<int:pk>',views.convertVideo,name='convertVideo'),
    path('downloadVideo/<int:pk>',views.downloadVideo,name='downloadVideo'),

]
