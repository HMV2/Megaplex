from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import logout
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from product.models import Product

def index_page(request):
    products = Product.objects.all()[:10]
    if request.method == 'POST':
        item = request.POST.get('item')
        if item !="":
            return redirect('/product/filter/'+item)
    context={
        'room_name':"broadcast",
        'products':products
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