from django.contrib.auth.forms import PasswordChangeForm
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from account.forms import ProfileForm
from account.models import Profile
from product.models import Product
from django.http import JsonResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from account.models import Profile
from .forms import ProductForm
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash

# Create your views here.

@login_required
def profile(request):
    user = Profile.objects.get(user=request.user)
    form = ProfileForm(instance=user)
    pform = PasswordChangeForm(user=request.user)
    try:
        active_products = Product.objects.filter(seller=request.user, is_active=True)
    except:
        active_products = None
    try:
        inactive_products = Product.objects.filter(seller=request.user, is_active=False)
    except:
        inactive_products = None
    context={
        'room_name':"broadcast",
        'profile':user,
        'active_products':active_products,
        'inactive_products':inactive_products,
        'form':form,
        'pform':pform
    }
    if request.method == "POST":
        tp = request.POST.get("tp")
        print('TP:' +tp)
        if tp == "profile":
            form = ProfileForm(request.POST, request.FILES, instance = user)
            if form.is_valid():
                form.save()
                messages.success(request,"Successfully updated the profile!")
                return redirect('/dashboard/profile')
            else:
                messages.error(request,"Failed to update profile!")
        elif tp =="password":
            pform = PasswordChangeForm(data=request.POST, user = request.user)
            if pform.is_valid():
                pform.save()
                update_session_auth_hash(request, pform.user)
                messages.success(request,"Successfully updated the password!")
                return redirect('/dashboard/profile')
            else:
                messages.error(request,"Something went wrong!")
                return render(request, 'dashboard/profile.html', {'form':form})

    return render(request, 'dashboard/profile.html',context)

@login_required
def change_password(request):
    """Function for changing user's password!"""
    if request.method == "POST":
        pform = PasswordChangeForm(data=request.POST, user = request.user)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect('/accounts/profile')
        else:
            messages.add_message(request, messages.ERROR,"Something Went Wrong!")
            return render(request, 'accounts/profile.html', {'form':form})

    else:
        form = PasswordChangeForm(user=request.user)
        context = {'form':form}
        return render(request, 'accounts/change_password.html', context)


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
        'room_name':"broadcast",
        'user':user,
        'profile':profile,
        'is_following': is_following,
        'profile_active':'is-active',
        'form':form
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
        'room_name':"broadcast"

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
        'profile':user,
        'room_name':"broadcast"
    }
    return render(request, 'dashboard/profile.html',context)


@login_required
def addProduct(request):
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        print(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,"Successfully added product!")
            return redirect('/dashboard/profile')
        else:
            messages.success(request,"Failed to add product!")
    form = ProductForm()
    context = {
        'form':form,
        'room_name':"broadcast"
    }
    return render(request, 'dashboard/addProduct.html',context)

@login_required
def editProduct(request, product_id):
    product = Product.objects.get(id=product_id)
    form = ProductForm(instance=product)
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES, instance = product)
        if form.is_valid():
            form.save()
            messages.success(request,"Successfully updated the product!")
            return redirect('/dashboard/profile')
        else:
            messages.success(request,"Failed to update product!")
    context = {
        'form':form,
        'room_name':"broadcast"
    }
    return render(request, 'dashboard/addProduct.html',context)


@login_required
def remove_product(request,product_id):
    product = Product.objects.get(id=product_id)
    product.delete()
    messages.success(request, 'Successfully Deleted the product!')
    return redirect('/dashboard/profile')

def wishlist(request):
    return render(request,'dashboard/wishlist.html')

