from math import prod
import profile
from re import U
from django.shortcuts import render
from django.template import context
from django.contrib.auth.models import User
from numpy import product
from account.models import Profile
from product.models import Product

# Create your views here.
def dashboard(request):
    users = User.objects.all()
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
