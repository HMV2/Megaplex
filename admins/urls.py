from unicodedata import name
from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('send_notification/',views.send_notification,name='send_notification'),
    path('add_category/',views.add_category,name='add_category'),
    path('add_subcategory/',views.add_subcategory,name='add_subcategory'),

    path('color/',views.color,name='color'),
    path('brand/',views.brand,name='brand'),

    path('error_page/',views.error_page)

    

    
]