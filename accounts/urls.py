from django.contrib.auth import login
from django.contrib.auth import views as auth_views
from django.urls import path
from . import views

#Account's URL
urlpatterns = [
    path('register/',views.register, name="register_user"),
    path('login/', views.login, name="login_user"),
    path('logout/', views.logout_user),

]