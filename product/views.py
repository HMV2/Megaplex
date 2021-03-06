from unicodedata import category
from django.http import request
from django.shortcuts import render, redirect
from .models import Category, Color, Product, Brand, Comment
from django.contrib.auth.models import User
from directChat.models import Chat_Message
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.contrib.auth.models import User
from django.contrib import messages
from .templatetags import extras
from django.http import JsonResponse
import random
from directChat.views import get_unread
from django.http import HttpResponse
from django.db import connection
from account.models import  transaction


def product_details(request,product_id):
    product = Product.objects.get(id=product_id)
    comments = Comment.objects.filter(product = product, parent=None)
    replies = Comment.objects.filter(product = product).exclude(parent=None)
    comment_count = comments.count()
    product_category = product.category
    no_of_random_items = 5
    recommendations = Product.objects.filter(category=product_category)
    possible_ids = list(recommendations.values_list('id', flat=True))  
    possible_ids = random.choices(possible_ids, k=no_of_random_items)
    recommended_products = recommendations.filter(pk__in=possible_ids)


    product.view_count += 1
    product.save()
    repDict = {}
    for reply in replies:
        if reply.parent.sno not in repDict.keys():
            repDict[reply.parent.sno] = [reply]
        else:
            repDict[reply.parent.sno].append(reply)

    context={
        'room_name':"broadcast",
        'product':product,
        'comments':comments,
        'count':comment_count,
        'reply':repDict,
        'recommended_products':recommended_products,
        'get_unread':get_unread(request),
      
        'room_name':"broadcast",
        
    }
    if request.method == 'POST':
        formType = request.POST.get('formType')
        if formType == "message" and request.POST.get('body')!="":
            from_user = request.user
            to_user_username = request.POST.get('to_user')
            body = request.POST.get('body')
            try:
                to_user = User.objects.get(username=to_user_username)
            except:
                to_user = User.objects.get(id=request.POST.get('to_user'))
            Chat_Message.send_message(from_user, to_user, body)
            messages.success(request,"Message Sent Successfully!")
            redirect('/product/details/'+str(product_id))
        elif formType == "message" and request.POST.get('body')=="":
            messages.error(request,"Please insert message to send!")
            redirect('/product/details/'+str(product_id))

        elif formType=="comment" and request.POST.get('comment')!="":
            comment = request.POST.get('comment')
            user = request.user
            product = Product.objects.get(id = product_id)
            commentSno = request.POST.get('commentSno')
            if commentSno == "":
                comment = Comment(comment_text=comment, user = user, product = product)
                comment.save()
                messages.success(request, "Comment added successfully")
                return redirect('/product/details/'+str(product_id))

            else:
                parent = Comment.objects.get(sno = commentSno)
                comment = Comment(comment_text=comment, user = user, product = product, parent = parent)
                comment.save()
                messages.success(request, "Reply added successfully")
                return redirect('/product/details/'+str(product_id))
            
        elif formType == "comment" and request.POST.get('comment')=="":
            messages.error(request,"Please insert comment to post!")
            return redirect('/product/details/'+str(product_id))

        elif formType == "wallet" and request.POST.get('Receiver1')!="":
            sender = request.POST['Sender1']
            sender = User.objects.get(username = sender)
            receiver = request.POST['Receiver1']
            receiver = User.objects.get(username = receiver)
            amount = int(request.POST['amount1'])
            if amount<0 or amount>product.price:
                messages.error(request,"Invalid Amount")
                return redirect('/product/details/'+str(product_id))
            with connection.cursor() as cursor:
                cursor.execute(
                    "select balance from account_profile where username = '%s'" % (sender))
                sender_balance = int(cursor.fetchall()[0][0])

            if int(sender_balance) >= int(amount):
                sender_new_balance = int(sender_balance) - int(amount)
                with connection.cursor() as cursor:
                    update_sender_balance = "update account_profile set balance = %d where username = '%s'" % (sender_new_balance, sender)
                    cursor.execute(update_sender_balance)
                    cursor.execute(
                        "select balance from account_profile where username = '%s'" % (receiver))
                    receiver_balance = cursor.fetchall()[0][0]
                receiver_new_balance = int(receiver_balance) + int(amount)
                with connection.cursor() as cursor:
                    update_receiver_balance = "update account_profile set balance = %d where username = '%s'" % (
                        receiver_new_balance, receiver)
                    cursor.execute(update_receiver_balance)

                txn = transaction(sender=sender,receiver=receiver,amount=amount)
                txn.save()
                
                messages.success(request, 'Successfully Transferred!')
                
            else:
                return HttpResponse("Failed")
            return redirect('/product/details/'+str(product_id))
            
    return render(request, 'product/details.html',context)

def filter_page(request):
    categories = Category.objects.all()
    cat_id = request.GET.get('category')
    brand_id = request.GET.get('brand')
    color_id = request.GET.get('color')
    sorting = request.GET.get('sort')
    products = Product.objects.all()

    if cat_id and cat_id != "all":
        products = Product.objects.filter(category=cat_id)
    if brand_id:
        products = Product.objects.filter(brand=brand_id)
    if color_id:
        products = Product.objects.filter(color=color_id)

    all_count = Product.objects.all().count()
    prices = Product.objects.values("price")
    price_list=[]
    
    for i in prices:
        price_list.append(i['price'])

    brands = Brand.objects.all()
    colors = Color.objects.all()
    min_tag = False
    min_pri = min(price_list)
    max_pri = max(price_list)
    search_item = ""

    if request.method == 'POST':
        form_type = request.POST.get('form_type')
        if(form_type=="price"):
            min_pri = request.POST.get('minPrice')
            max_pri = request.POST.get('maxPrice')
            products = products.filter(price__gte=min_pri,price__lte=max_pri)
            min_tag = True
        elif form_type == 'search':
            item = request.POST.get('key').capitalize()
            search_item = item
            products = products.filter(name__contains=item)
    found_count = products.count()
    if sorting=="high":
        products = products.order_by('-price')
    if sorting=="low":
        products = products.order_by('price')

    paginator = Paginator(products,6)
    page_num = request.GET.get('page')
    product_list = paginator.get_page(page_num)
   
    context = {
        'room_name':"broadcast",
        'category':categories,
        'products':product_list,
        'all_count':all_count,
        'found_count':found_count,
        'brand':brands,
        'colors':colors,
        'min_tag':min_tag,
        'min_price1':min_pri,
        'max_price1':max_pri,
        'search_item': search_item,
        'page_num': page_num,
        'get_unread':get_unread(request)
    }
    return render(request,'product/filter.html',context)

def searchProduct(request, item):
    products = Product.objects.filter(name__contains=item)
    categories = Category.objects.all()
    cat_id = request.GET.get('category')
    brand_id = request.GET.get('brand')
    color_id = request.GET.get('color')
    sorting = request.GET.get('sort')

    if cat_id and cat_id != "all":
        products = Product.objects.filter(category=cat_id)
    if brand_id:
        products = Product.objects.filter(brand=brand_id)
    if color_id:
        products = Product.objects.filter(color=color_id)

    all_count = Product.objects.all().count()
    prices = Product.objects.values("price")
    price_list=[]
    
    for i in prices:
        price_list.append(i['price'])

    brands = Brand.objects.all()
    colors = Color.objects.all()
    min_tag = False
    min_pri = min(price_list)
    max_pri = max(price_list)
    search_item = item

    if request.method == 'POST':
        form_type = request.POST.get('form_type')
        if(form_type=="price"):
            min_pri = request.POST.get('minPrice')
            max_pri = request.POST.get('maxPrice')
            products = products.filter(price__gte=min_pri,price__lte=max_pri)
            min_tag = True
        elif form_type == 'search':
            item = request.POST.get('key').capitalize()
            search_item = item
            products = products.filter(name__contains=item)
    found_count = products.count()
    if sorting=="high":
        products = products.order_by('-price')
    if sorting=="low":
        products = products.order_by('price')

    pag = Paginator(products,6)
    page_num = request.GET.get('page_num')
    try:
        page = pag.page(page_num)
    except:
        page = pag.page(1)
        page_num = 1
    context = {
        'room_name':"broadcast",
        'category':categories,
        'products':page,
        'all_count':all_count,
        'found_count':found_count,
        'brand':brands,
        'colors':colors,
        'min_tag':min_tag,
        'min_price1':min_pri,
        'max_price1':max_pri,
        'search_item': search_item,
        'page_num': page_num,
        'get_unread':get_unread(request)
    }
    return render(request,'product/filter.html',context)


def searchUserProduct(request, user):
    products = Product.objects.filter(seller__id = user)
    categories = Category.objects.all()
    cat_id = request.GET.get('category')
    brand_id = request.GET.get('brand')
    color_id = request.GET.get('color')
    sorting = request.GET.get('sort')

    if cat_id and cat_id != "all":
        products = Product.objects.filter(category=cat_id)
    if brand_id:
        products = Product.objects.filter(brand=brand_id)
    if color_id:
        products = Product.objects.filter(color=color_id)

    all_count = Product.objects.all().count()
    prices = Product.objects.values("price")
    price_list=[]
    
    for i in prices:
        price_list.append(i['price'])

    brands = Brand.objects.all()
    colors = Color.objects.all()
    min_tag = False
    min_pri = min(price_list)
    max_pri = max(price_list)

    if request.method == 'POST':
        form_type = request.POST.get('form_type')
        if(form_type=="price"):
            min_pri = request.POST.get('minPrice')
            max_pri = request.POST.get('maxPrice')
            products = products.filter(price__gte=min_pri,price__lte=max_pri)
            min_tag = True
        elif form_type == 'search':
            item = request.POST.get('key').capitalize()
            products = products.filter(name__contains=item)
    found_count = products.count()
    if sorting=="high":
        products = products.order_by('-price')
    if sorting=="low":
        products = products.order_by('price')

    pag = Paginator(products,6)
    page_num = request.GET.get('page_num')
    try:
        page = pag.page(page_num)
    except:
        page = pag.page(1)
        page_num = 1
    context = {
        'room_name':"broadcast",
        'category':categories,
        'products':page,
        'all_count':all_count,
        'found_count':found_count,
        'brand':brands,
        'colors':colors,
        'min_tag':min_tag,
        'min_price1':min_pri,
        'max_price1':max_pri,
        'page_num': page_num,
        'get_unread':get_unread(request)
    }
    return render(request,'product/filter.html',context)





# when user like a ajax call is made using this function to get no of like in post and if the postis like or not
@login_required
def ToggleProductlike(request,product_id):
    # an ajax call is made using this function
    product = Product.objects.get(id = product_id)
    like_count = Product.objects.filter(product_likes = request.user).count()
    is_like = False
    if request.method =='POST':
        for like in product.product_likes.all():
            if like == request.user:
                is_like =True
                like_count = Product.objects.filter(product_likes = request.user).count()
                
                break
        if not is_like:
            product.product_likes.add(request.user)
            like_count = Product.objects.filter(product_likes = request.user).count()
            
                
            
        if is_like:
            product.product_likes.remove(request.user)
            like_count = Product.objects.filter(product_likes = request.user).count() 
            

    return JsonResponse({"is_like":is_like,"like_count":like_count})


def RemoveFromLikedList(request,product_id):
    product = Product.objects.get(id = product_id)
    
    for like in product.product_likes.all():
        if like == request.user :
            product.product_likes.remove(request.user)
            break

    return redirect('/dashboard/wishlist')
            

def like_toggle(request,comment_id):
    comment = Comment.objects.get(sno = comment_id)
    like_count = comment.likes.count()
    is_like = False
    if request.method =='POST':
        for like in comment.likes.all():
            if like == request.user:
                is_like =True
                like_count = comment.likes.count()
                break
        if not is_like:
            comment.likes.add(request.user)
            like_count = comment.likes.count()


        if is_like:
            comment.likes.remove(request.user) 
            like_count = comment.likes.count()



    return JsonResponse({"is_like":is_like,"like_count":like_count})



def explorepage(request):
    electro = Product.objects.filter(category__name="Electronics").order_by("-view_count")[:4]
    electro_id = Category.objects.get(name="Electronics")
    cloth = Product.objects.filter(category__name="Clothing").order_by("-view_count")[:4]
    cloth_id = Category.objects.get(name="Clothing")
    auto = Product.objects.filter(category__name="Real Estate").order_by("-view_count")[:4]
    auto_id = Category.objects.get(name="Real Estate")
    sports = Product.objects.filter(category__name="Fashion").order_by("-view_count")[:4]
    sports_id = Category.objects.get(name="Fashion")
    context={
        'room_name':"broadcast",
        'electro':electro,
        'cloth':cloth,
        'auto':auto,
        'sports':sports,
        'electro_id':electro_id,
        'cloth_id':cloth_id,
        'auto_id':auto_id,
        'sports_id':sports_id,
        'get_unread':get_unread(request)
    }
    return render(request,'product/explore.html',context)
           

        


    
    
