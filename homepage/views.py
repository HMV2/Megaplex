from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import logout
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from product.models import Category
from product.models import Product
from django.core.mail import send_mail
from django.conf import settings
from django.contrib import messages

def index_page(request):
    products = Product.objects.all()[:10]
    user_list = getUserCount()
    pro_list = ""
    if len(user_list)>0:
        pro_list = [0]*len(user_list)
        ln = 0
        for i in user_list:
            pro_list[ln] = [Product.objects.filter(seller__id = i)[:4]]
            ln +=1

    if request.method == 'POST':
        item = request.POST.get('item')
        if item !="":
            return redirect('/product/filter/'+item)
        
    # collection = Product.objects.filter(seller__id = user_list[0])
    # for i in range(1,len(user_list)):
    #     data =  Product.objects.filter(seller__id = user_list[i])
    #     collection |= data
    context={
        'room_name':"broadcast",
        'products':products,
        'collection':pro_list
    }
    if request.method == 'POST':
        type = request.POST.get('type')
        if type=='search':
            item = request.POST.get('item')
            if item !="":
                return redirect('/product/filter/'+item) 

        elif type=="contact":
            subject = request.POST.get('subject')
            email = request.POST.get('email')
            desc = request.POST.get('desc') + "\n" + "Reply Email: "+email
            test = send_mail(subject, desc, settings.EMAIL_HOST_USER, [email], fail_silently=False)
            if test==1:
                messages.success(request,"Message Sent Successfully! '\n' Please check your mailbox for reply ")
                return redirect("/")

            else:
                messages.error(request,"Failed to send message")
                return redirect("/")

    return render(request, 'homepage/homepage.html',context)


def logout_view(request):
    logout(request)
    return redirect('/')


def category(request):
    category = Category.objects.all()
    context={
        'room_name':"broadcast",
        'products':category,
        'category':category
    }
    return render(request, 'homepage/category.html', context)



def getUserCount():
    products = Product.objects.all()
    users = {}
    for i in products:
        if i.seller.id in users:
            users[i.seller.id] += 1
        else:
            users[i.seller.id] = 1
    users_with_valid_numbers = []
    for key in users:
        if users[key]>3:
            users_with_valid_numbers.append(key)

    return users_with_valid_numbers
