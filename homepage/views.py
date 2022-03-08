from django.shortcuts import redirect, render
from django.contrib.auth import logout
from product.models import Category
from product.models import Product
from django.core.mail import send_mail
from django.conf import settings
from django.contrib import messages
from directChat.views import get_unread
from django.db import connection

def index_page(request):
    products = Product.objects.filter( is_active=True ).order_by('-view_count')[:10]
    user_list = getUserCount()
    pro_list = ""
    if len(user_list)>0:
        pro_list = [0]*len(user_list)
        ln = 0
        for i in user_list:
            pro_list[ln] = [Product.objects.filter(seller__id = i)[:4]]
            ln +=1
        

    context={
        'room_name':"broadcast",
        'products':products,
        'collection':pro_list,
        'get_unread':get_unread(request)
    }
    if request.method == 'POST':
        type = request.POST.get('type')
        if type=='search':
            item = request.POST.get('item').capitalize()
            if item !="":
                return redirect('/product/filter/'+item) 

        elif type=="contact":
            subject = request.POST.get('subject')
            email = request.POST.get('email')
            desc = request.POST.get('desc') + "\n" + "Reply Email: "+email
            send_mail(subject, desc, settings.EMAIL_HOST_USER, [settings.EMAIL_HOST_USER], fail_silently=False)

            messages.success(request,"Your Message has been sent \n You will soon hear from us!")
            return redirect("/")

    return render(request, 'homepage/homepage.html',context)


def logout_view(request):
    logout(request)
    return redirect('/')


def category(request):
    category = Category.objects.all()
    context={
        'products':category,
        'category':category,
        'room_name':"broadcast",
        'get_unread':get_unread(request)
    }
    return render(request, 'homepage/category.html', context)



def getUserCount():
    products = Product.objects.all()
    users = {}
    for i in products:
        if i.seller.id in users:
            users[i.seller.id] += 1
        else:
            users[i.seller.id] = 1
    users_with_valid_numbers = []
    for key in users:
        if users[key]>3:
            users_with_valid_numbers.append(key)

    return users_with_valid_numbers


def fun(request):
    return render(request,'homepage/fun.html', {'room_name':"broadcast"})

def fun2(request):
    return render(request,'homepage/fun2.html', {'room_name':"broadcast"})

def games(request):
    return render(request,'homepage/games.html',{'room_name':"broadcast"})

def about(request):
    context={
        'room_name':"broadcast",
        'get_unread':get_unread(request)
    }
    return render(request,'homepage/about_us.html', context)