from math import prod
import profile
from re import U
from unicodedata import category
from django.shortcuts import render
from django.template import context
from django.contrib.auth.models import User
from numpy import product

from account.models import Profile
from product.models import Product,Category,Sub_Category
from .forms import NotificationForm,CategoryForm, SubcategoryForm
from django.contrib import messages
from django.shortcuts import redirect
import os
from django.contrib.auth import logout

# test

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
    active_product_count = product.filter(is_active=True).count()
    inactive_product_count = product.filter(is_active=False).count()



    for i in product:
        view_count += i.view_count

    context={
        'admins':admin_info,
        'users': user_info,
        'users_count':user_count,
        'view_count':view_count,
        'top_seller':top_sellers,
        'top_products':top_products,
        'active_product_count':active_product_count,
        'inactive_product_count':inactive_product_count
        
    }
    return render(request, 'admins/dashboard.html',context)



def send_notification(request):
    notform = NotificationForm()
    if request.method == "POST":
        form = NotificationForm(request.POST)
        if form.is_valid():
            form.save() 
            messages.success(request,"Successfully Scheduled Notification!")
            return redirect('/admins/dashboard')
        else:
            messages.error(request,"Failed to Scheduled Notification!")


    context = {'form':notform}
    return render(request,'admins/send_notification.html',context)

def add_category(request):
    category = Category.objects.all()
    
    add_form = CategoryForm()

    if request.method == "POST":
        type = request.POST.get('type')
        if type=="add":
            form = CategoryForm(request.POST,request.FILES)
            if form.is_valid():
                form.save()
                messages.success(request, "Successfully Added Category")
                return redirect('/admins/add_category')
            else:
                messages.error(request,"Failed to Added Category!")
        elif type =="edit":
            category_id = request.POST['category_id']
            print(category_id)
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
    category = Sub_Category.objects.all()
    print(category)
    
    add_form = SubcategoryForm()

    if request.method == "POST":
        type = request.POST.get('type')
        if type=="add":
            form = SubcategoryForm(request.POST,request.FILES)
            if form.is_valid():
                form.save()
                messages.success(request, "Successfully Added Subcategory")
                return redirect('/admins/add_subcategory')
            else:
                messages.error(request,"Failed to Added Subcategory!")
        elif type =="edit":
            category_id = request.POST['category_id']
            category = Sub_Category.objects.get(id = category_id)
            if request.FILES.get('category_image'):
                # if you are going to replace your image it will replace and remove the previous one
                os.remove(category.picture.path)
                category.name = request.POST['category_name']
                category.picture= request.FILES['category_image']
                category.save()
                return redirect('/admins/add_subcategory')
            else:
                category.name = request.POST['category_name']
                category.save()       
                return redirect('/admins/add_subcategory')


    context = {
        'category':category,
        "add_form" : add_form
    }
    return render(request,'admins/add_subcategory.html', context)


def edit_category(request,category_id):
 
    category = Category.objects.get(id = category_id)

    if request.method == 'POST':
        if request.FILES.get('cateogry_image'):
                # if you are going to replace your image it will replace and remove the previous one
            os.remove(category.post_image.path)
            category.description = request.POST['category_name']
            category.picture= request.FILES['category_image']
            category.save()
            return redirect('/admins/add_category')
        else:
            category.name = request.POST['category_name']
            category.save()       
            return redirect('/admins/add_category')
       
        

def deactive(request, id):
    user = User.objects.get(id=id)
    user.is_active = False
    user.save()
    messages.success(request, "Successfully Deactivated User Account")
    return redirect('/admins/dashboard')

def active(request, id):
    user = User.objects.get(id=id)
    user.is_active = True
    user.save()
    messages.success(request, "Successfully Activated User Account")
    return redirect('/admins/dashboard')


def unverify(request, id):
    user = Profile.objects.get(user=id)
    user.verified = False
    user.save()
    messages.success(request, "Successfully Unverified User Account")
    return redirect('/admins/dashboard')

def verify(request, id):
    user = Profile.objects.get(user=id)
    user.verified = True
    user.save()
    messages.success(request, "Successfully Verified User Account")
    return redirect('/admins/dashboard')

def logout_user(request):
    logout(request)
    return redirect('/account/login')

def deleteSub(request, id):
    sub = Sub_Category.objects.get(id=id)
    sub.delete()
    messages.success(request, "Successfully Deleted Sub Category")
    return redirect('/admins/add_subcategory')

def deleteCat(request, id):
    sub = Category.objects.get(id=id)
    sub.delete()
    messages.success(request, "Successfully Deleted Category")
    return redirect('/admins/add_category')

