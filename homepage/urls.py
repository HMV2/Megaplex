from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index_page, name='index_page'),
    path('fun/',views.fun),
    path('fun2/',views.fun2),
    path('games/',views.games),
    path('category/', views.category, name='category'),
    path('logout/', views.logout_view),
    path('about/', views.about),
]