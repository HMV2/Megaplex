from django.shortcuts import render


def index_page(request):
    return render(request, 'homepage/homepage.html')



def register_page(request):
    return render(request,'register.html')