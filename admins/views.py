from math import prod
import profile
from re import U
from unicodedata import category
from django.shortcuts import render
from django.template import context
from django.contrib.auth.models import User
from numpy import product
from account.models import Profile
from product.models import Product,Category,Sub_Category,Brand,Color
from .forms import NotificationForm,CategoryForm,BrandForm,ColorForm
from django.contrib import messages
from django.shortcuts import redirect
from notification.models import BroadcastNotification
import os


# Create your views here.
def dashboard(request):
    users = User.objects.all()

    user_info = users.filter(is_staff=0)
    admin_info = users.filter(is_staff=1)
    context={
        'admin_info':admin_info,
        'user_info':user_info,
    }
    user_count = users.count()
    user_info = User.objects.filter(is_staff=0)
    admin_info = User.objects.filter(is_staff=1)
    product = Product.objects.all()
    view_count = 0
    profiles = Profile.objects.all()
    top_sellers = profiles.order_by('-product_sold')
    top_products = product.order_by('-view_count')[:5]




    for i in product:
        view_count += i.view_count

    context={
        'admins':admin_info,
        'users': user_info,
        'users_count':user_count,
        'view_count':view_count,
        'top_seller':top_sellers,
        'top_products':top_products
        
    }
    return render(request, 'admins/dashboard.html',context)



def send_notification(request):
    notification = BroadcastNotification.objects.all()
    notform = NotificationForm()
    if request.method == "POST":
        form = NotificationForm(request.POST)
        if form.is_valid():
            form.save() 
            messages.success(request,"Successfully Scheduled Notification!")
            return redirect('/admins/send_notification')
        else:
            messages.error(request,"Failed to Scheduled Notification!")


    context = {'form':notform,'notification':notification}
    return render(request,'admins/send_notification.html',context)

def add_category(request):
    category = Category.objects.all()
    
    add_form = CategoryForm()

    if request.method == "POST":
        type = request.POST.get('type')
        if type=="add":
            form = CategoryForm(request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, "Successfully Added Category")
                return redirect('/admins/add_category')
            else:
                messages.error(request,"Failed to Added Category!")
        elif type =="edit":
            category_id = request.POST['category_id']
            category = Category.objects.get(id = category_id)
            if request.FILES.get('category_image'):
                # if you are going to replace your image it will replace and remove the previous one
                os.remove(category.picture.path)
                category.name = request.POST['category_name']
                category.picture= request.FILES['category_image']
                category.save()
                return redirect('/admins/add_category')
            else:
                category.name = request.POST['category_name']
                category.save()       
                return redirect('/admins/add_category')


    context = {
        'category':category,
        "add_form" : add_form
    }
    return render(request,'admins/add_category.html', context)


def add_subcategory(request):
    sub_category = Sub_Category.objects.all()
    return render(request,'admins/add_subcategory.html',{'sub_category':sub_category})



def color(request):
    color = Color.objects.all()
    add_form = ColorForm()

    if request.method == "POST":
        type = request.POST.get('type')
        if type=="add":
            form = ColorForm(request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, "Successfully Added Color")
                return redirect('/admins/color')
            else:
                messages.error(request,"Failed to Added Color!")

    return render(request,'admins/color.html',{'color':color,"add_form" : add_form})     


def brand(request):
    add_form = BrandForm()
    brand = Brand.objects.all()

    if request.method == "POST":
        type = request.POST.get('type')
        if type=="add":
            form = BrandForm(request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, "Successfully Added Brand")
                return redirect('/admins/brand')
            else:
                messages.error(request,"Failed to Added Color!")
    return render(request,'admins/brand.html',{'brand':brand,"add_form" : add_form})   



def error_page(request):
    return render(request,'admins/404.html')
        

