from django.contrib.auth import login
from django.contrib.auth import views as auth_views
from django.urls import path
from . import views

#Account's URL
urlpatterns = [
    path('register/',views.register, name="register_user"),
    path('login/', views.login, name="login_user"),
    path('logout/', views.logout_user),

    path('password_reset/', auth_views.PasswordResetView.as_view(template_name="account/password_reset_form.html"), name="password_reset"),
    path('password_reset_sent/', auth_views.PasswordResetDoneView.as_view(template_name="account/password_reset_sent.html"), name="password_reset_done"),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name="account/password_reset_confirm.html"), name="password_reset_confirm"),
    path('reset/done', auth_views.PasswordResetCompleteView.as_view(template_name="account/password_reset_complete.html"), name="password_reset_complete"),
    

]