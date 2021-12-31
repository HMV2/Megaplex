from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from account.models import Profile
# Create your views here.

@login_required
def profile(request):
    user = Profile.objects.get(user=request.user)
    context={
        'profile':user
    }
    return render(request, 'dashboard/profile.html',context)