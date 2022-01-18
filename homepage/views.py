from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import logout
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from product.models import Product

def index_page(request):
    products = Product.objects.all()[:10]
    user_list = getUserCount()
    pro_list = ""
    if len(user_list)>0:
        pro_list = [0]*len(user_list)
        ln = 0
        for i in user_list:
            pro_list[ln] = [Product.objects.filter(seller__id = i)[:3]]
            ln +=1
        
    # collection = Product.objects.filter(seller__id = user_list[0])
    # for i in range(1,len(user_list)):
    #     data =  Product.objects.filter(seller__id = user_list[i])
    #     collection |= data
    if request.method == 'POST':
        item = request.POST.get('item')
        if item !="":
            return redirect('/product/filter/'+item)
    context={
        'room_name':"broadcast",
        'products':products,
        'collection':pro_list
    }
    return render(request, 'homepage/homepage.html',context)


def logout_view(request):
    logout(request)
    return redirect('/')


def category(request):
    return render(request, 'homepage/category.html', {'room_name':"broadcast"})

def test(request):
    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        "notification_broadcast",{
            'type':'send_notification',
            'message':'Notification'
        }
    )
    return HttpResponse('Done')


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
        if users[key]>2:
            users_with_valid_numbers.append(key)

    return users_with_valid_numbers
