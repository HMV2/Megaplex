from django.core import validators
from .models import Profile
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserChangeForm, UserCreationForm
from django import forms
from django.forms import ModelForm

USER_CHOICES = [
    ("Individual","Individual"),
    ("Organization", "Organization")
    ]

class UserForm(UserCreationForm):
    """Form for creating Users"""
    first_name =  forms.CharField(max_length=50)
    last_name = forms.CharField(max_length=50)
    email = forms.EmailField()
    username = forms.CharField()
    plan = forms.CharField(label="Choose the type of membership", widget=forms.Select(choices=USER_CHOICES)) 
    fields = ['first_name', 'last_name','email','username', "plan"]

class LoginForm(forms.Form):
    """Form to allow users to log in"""
    username = forms.CharField(validators=[validators.MinLengthValidator(3)])
    password = forms.CharField(widget=forms.PasswordInput)


class ProfileForm(ModelForm):
    """Form for creating User profile"""
    class Meta:
        model = Profile
        fields = "__all__"
        exclude = ['user', 'email', 'username']