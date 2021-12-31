from django.shortcuts import render
from .models import Product

def product_details(request,product_id):
    product = Product.objects.get(id=product_id)
    context={
        'product':product
    }
    return render(request, 'product/details.html',context)
