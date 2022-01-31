from math import prod
import profile
from re import U
from unicodedata import category
from django.shortcuts import render
from django.template import context
from django.contrib.auth.models import User
from numpy import product
from account.models import Profile
from product.models import Product,Category
from .forms import NotificationForm
from django.contrib import messages
from django.shortcuts import redirect


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
    notform = NotificationForm()
    if request.method == "POST":
        form = NotificationForm(request.POST)
        if form.is_valid():
            form.save() 
            messages.success(request,"Successfully Scheduled Notification!")
            return redirect('/admins/dashboard')
        else:
            messages.success(request,"Failed to Scheduled Notification!")


    context = {'form':notform}
    return render(request,'admins/send_notification.html',context)

def add_category(request):
    category = Category.objects.all()
    return render(request,'admins/add_category.html',{'category':category})


def add_subcategory(request):
    return render(request,'admins/add_subcategory.html')


