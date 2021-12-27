from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index_page, name='index_page'),
    path('logout/', views.logout_view),
]