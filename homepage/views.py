from django.shortcuts import redirect, render
from django.contrib.auth import logout


def index_page(request):
    return render(request, 'homepage/homepage.html')

def logout_view(request):
    logout(request)
    return redirect('/')