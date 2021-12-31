from django.shortcuts import render

def product_details(request):
    return render(request, 'products/details.html')
