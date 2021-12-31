from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('profile/', views.profile, name='profile'),
]