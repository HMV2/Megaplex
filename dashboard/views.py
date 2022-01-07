from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from account.models import Profile
from product.models import Product
from django.http import JsonResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from account.models import Profile
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


@login_required
def User_Profile(request,profile_id):
    profile = Profile.objects.get(id = profile_id)
    user = profile.user
    followers = profile.followers.all()
    if len(followers) == 0:
            is_following = False

    for follower in followers:
        if follower == request.user:
            is_following = True
            break  
        else:
            is_following = False 

    context = {
        'user':user,
        'profile':profile,
        'is_following': is_following,
        'profile_active':'is-active'
        }
    return render (request,'dashboard/profile.html',context)


#when user click  to follow other user  the user will be added as follower for other user and 
#the other user will be added as a following of the user
#if not following 
@login_required
def AddFollowers(request,profile_id):
    logged_in_user = request.user.profile.id
    profile = Profile.objects.get(id = profile_id)
    user_profile = Profile.objects.get(id = logged_in_user)
    user_id = profile.user
    user_profile_id = user_profile.user
    profile.followers.add(user_profile_id)
    user_profile.following.add(user_id)
    return redirect('/dashboard/profile/{}'.format(profile.id))


#when user click un-follow to un-follow other user  the user will be remove and no longer be follower  
#the other user will be removed  and won't be following the other user
#if is following 
@login_required
def RemoveFollowers(request,profile_id):
    logged_in_user = request.user.profile.id
    profile = Profile.objects.get(id = profile_id)
    user_profile = Profile.objects.get(id = logged_in_user)
    user_id = profile.user
    user_profile_id = user_profile.user
    profile.followers.remove(user_profile_id)
    user_profile.following.remove(user_id)
    return redirect('/dashboard/profile/{}'.format(profile.id))


@login_required
def follower_list(request,profile_id):
    profile = Profile.objects.get(id = profile_id)
    user_profile = Profile.objects.filter()
    user = profile.user
    followings=profile.following.all()
    followers=profile.followers.all()
    context = {
        'user':user,
        'profile':profile,
        'user_profiles':user_profile,
        'followings':followings,
        'followers':followers,

    } 
    return render (request,'dashboard/follower_list.html',context)


#login user can remove the follower for follower list
@login_required
def Delete_Follower(request,follower_id):
    logged_in_user = request.user.profile.id
    profile = Profile.objects.get(id = logged_in_user)
    user_profile = Profile.objects.get(id = follower_id)
    user_id = user_profile.user
    profile_id = profile.user
    followers = profile.followers.all()
    user_id = user_profile.user
    is_remove = False

    if request.method == 'POST':
        for follower in followers:

            if follower == profile_id:
                is_remove = True
                break

        if not is_remove:
            profile.followers.remove(user_id)
            user_profile.following.remove(profile_id)

        return JsonResponse({"is_remove":is_remove})



#login_user will be able to follow and un_follow users

def togglefollowing(request,following_id):
    logged_in_user = request.user.profile.id

    profile = Profile.objects.get(id = logged_in_user)
    user_profile = Profile.objects.get(id = following_id)
    user_id = user_profile.user
    profile_id = profile.user
    followings = profile.following.all()
    is_remove = False

    if request.method == 'POST':
        for following in followings:
            if following == user_id:
                is_remove = True
                break
        if not is_remove:
            profile.following.add(user_id)
            user_profile.followers.add(profile_id)

        if is_remove:
            profile.following.remove(user_id)
            user_profile.followers.remove(profile_id)

        return JsonResponse({"is_remove":is_remove})
    context={
        'profile':user
    }
    return render(request, 'dashboard/profile.html',context)


def wishlist(request):
    return render(request,'dashboard/wishlist.html')