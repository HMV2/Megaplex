from django.shortcuts import render
from django.contrib.auth import logout, login, authenticate
from django.shortcuts import redirect, render
from .forms import ProfileForm, UserForm
from django.contrib import messages
from .models import Profile


def login(request):
    pass

def register(request):
    form = UserForm()
    if request.method == "POST":
        form = UserForm(request.POST)
        if form.is_valid():
            user = form.save()
            Profile.objects.filter(user=user).update(email = user.email, firstname = user.first_name, lastname = user.last_name)
            messages.add_message(request, messages.SUCCESS, "User Registered Successfully. Please Login to continue")
            return redirect('/')
        else:
            messages.add_message(request, messages.ERROR,"User Registration Failed!")
            return render(request, 'account/register.html', {'form':form})
        
    context={
        'form':form
    }
    return render(request, "account/register.html", context)


def logout_user(request):
    logout(request)
    return redirect('/account/login')