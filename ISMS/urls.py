"""ISMS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.contrib import admin
from django.contrib.auth.decorators import login_required as auth
from django.views.generic.base import RedirectView
from . import views

urlpatterns = patterns(
    '',
    #url(r'^$', views.HomePage.as_view(), name='home'),
    url(r'^$', RedirectView.as_view(url='/login/', permanent=False), name='home'),
    url(r'^about/$', views.AboutPage.as_view(), name='about'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^markdown/', include("django_markdown.urls")),
    url(r'^RiskManagement/', include('RiskManagement.urls', namespace="risk")),
    url(r'^login/$', "django.contrib.auth.views.login", {"template_name": "login.html"}, name="login"),
    url(r'^logout/$', "django.contrib.auth.views.logout_then_login", name="logout"),
)

# User-uploaded files like profile pics need to be served in development
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
#urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
