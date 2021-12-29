from django.contrib.auth import logout, login, authenticate
from django.shortcuts import redirect, render
from .forms import ProfileForm, UserForm
from django.contrib import messages, auth
from .models import Profile
from django.contrib import messages
from django.contrib.auth.models import User


def login(request):
    if request.method == 'POST':
        uname = request.POST['username']
        passwd = request.POST['password']

        user = auth.authenticate(username=uname, password=passwd)

        if user is not None:
            if not user.is_staff:
                auth.login(request, user)
                messages.success(request,"Welcome to Megaplex World")
                return redirect("/account/login")

            elif user.is_staff:
                auth.login(request, user)
                return redirect('/admins')

        else:
            messages.add_message(request, messages.ERROR, "Invalid Username and Password!")
            return render(request, 'account/login.html')

    else:
        return render(request, 'account/login.html')



def register(request):
    form = UserForm()
    if request.method == "POST":
        form = UserForm(request.POST)
        if form.is_valid():
            first_name, last_name, email, username,password = form.cleaned_data['first_name'],form.cleaned_data['last_name'],form.cleaned_data['email'],form.cleaned_data['username'],form.cleaned_data['password1']
            plan = form.cleaned_data['plan']
            user = User.objects.create(first_name = first_name, last_name = last_name, username = username, email = email, password = password)
            Profile.objects.create(user=user,email = user.email, firstname = user.first_name, lastname = user.last_name, plan=plan)
            messages.success(request,"Megaplex user created, You can enjoy the features!")
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