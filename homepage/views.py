from django.shortcuts import render


def index_page(request):
    return render(request, 'homepage/homepage.html')


def login_page(request):
    return render(request,'homepage/login.html')
