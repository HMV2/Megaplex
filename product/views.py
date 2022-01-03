from django.shortcuts import render
from .models import Product
from django.contrib.auth.models import User
from directChat.models import Chat_Message
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.urls import reverse
from django.http.response import HttpResponseBadRequest
from django.contrib import messages

def product_details(request,product_id):
    product = Product.objects.get(id=product_id)
    context={
        'product':product
    }
    if request.method == 'POST' and request.POST.get('body')!="":
        from_user = request.user
        to_user_username = request.POST.get('to_user')
        body = request.POST.get('body')
        print("body "+body)
        try:
            to_user = User.objects.get(username=to_user_username)
        except:
            to_user = User.objects.get(id=request.POST.get('to_user'))
        Chat_Message.send_message(from_user, to_user, body)
        messages.success(request,"Message Sent Successfully!")
        return render(request, 'product/details.html',context)
    elif request.method == 'POST' and request.POST.get('body')=="":
        messages.error(request,"Please insert message to send!")
        return render(request, 'product/details.html',context)
        # HttpResponseBadRequest()


    return render(request, 'product/details.html',context)

def filter_page(request):
    return render(request,'product/filter.html')