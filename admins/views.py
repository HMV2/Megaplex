import profile
from django.shortcuts import render
from django.template import context
from django.contrib.auth.models import User
from account.models import Profile

# Create your views here.
def dashboard(request):
    users = User.objects.all()

    user_info = users.filter(is_staff=0)
    admin_info = users.filter(is_staff=1)
    context={
        'admin_info':admin_info,
        'user_info':user_info,

        
    }
    return render(request, 'admins/dashboard.html',context)
