from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from account.models import Profile
from product.models import Product
# Create your views here.

@login_required
def profile(request):
    user = Profile.objects.get(user=request.user)
    try:
        active_products = Product.objects.filter(seller=request.user, is_active=True)
    except:
        active_products = None
    try:
        inactive_products = Product.objects.filter(seller=request.user, is_active=False)
    except:
        inactive_products = None

    print(active_products)
    print(inactive_products)
    context={
        'profile':user,
        'active_products':active_products,
        'inactive_products':inactive_products
    }
    return render(request, 'dashboard/profile.html',context)