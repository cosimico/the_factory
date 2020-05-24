"""web URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myApp.views import new_machine, test, home, setup, machine_new_key, machine_new, machine_view_key, new_group


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home),
    path('new_machine/', new_machine),
    path('new_machine/machine_new_key/', machine_new_key),
    path('new_machine/machine_new/', machine_new),
    path('new_machine/machine_show_key/', machine_view_key),
    path('new_group/', new_group),


    path('form/test/', test),
    path('form/setup/', setup),

]