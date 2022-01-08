from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index_page, name='index_page'),
    path('test/', views.test, name='index_page'),
    path('category/', views.category, name='category'),
    path('logout/', views.logout_view),
]