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
    email = forms.EmailField()
    plan = forms.CharField(label="Choose the type of membership", widget=forms.Select(choices=USER_CHOICES)) 
    class Meta:
        model = User
        fields = ['first_name', 'last_name','email','username', "plan",'password1','password2']


class LoginForm(forms.Form):
    """Form to allow users to log in"""
    username = forms.CharField(validators=[validators.MinLengthValidator(3)])
    password = forms.CharField(widget=forms.PasswordInput)


class ProfileForm(ModelForm):
    """Form for creating User profile"""
    desc = forms.CharField(
        label='desc',
        widget=forms.Textarea(attrs={
            'rows':'3',
            'placeholder':''
        })
    )
    class Meta:
        model = Profile
        fields = "__all__"
        exclude = ['user', 'email', 'username']