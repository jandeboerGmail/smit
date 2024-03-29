"""smit URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import include, path

from two_factor.urls import urlpatterns as tf_urls
# from two_factor.admin import AdminSiteOTPRequired
from django.views.generic.base import TemplateView

#admin.site.__class__ = AdminSiteOTPRequired

app_name = 'camera'

urlpatterns = [
    #path('', include('user_sessions.urls', 'user_sessions')),

    path('', include(tf_urls)),
    path('', include('camera.urls')),
    path('camera/', include('camera.urls')),
    path('admin/', admin.site.urls),
    
    path("accounts/", include("accounts.urls")),  # new
    path("accounts/", include("django.contrib.auth.urls")),

]
