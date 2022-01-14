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

@login_required
def product_details(request,product_id):
    product = Product.objects.get(id=product_id)
    comments = Comment.objects.filter(product = product, parent=None)
    replies = Comment.objects.filter(product = product).exclude(parent=None)
    comment_count = comments.count()
    product.view_count += 1
    repDict = {}
    for reply in replies:
        if reply.sno not in repDict.keys():
            repDict[reply.parent.sno] = [reply]
        else:
            repDict[reply.parent.sno].append(reply)
    print(repDict)
    context={
        'product':product,
        'comments':comments,
        'count':comment_count,
        'reply':repDict
    }
    if request.method == 'POST':
        formType = request.POST.get('formType')
        if formType == "message" and request.POST.get('body')!="":
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
        elif formType == "message" and request.POST.get('body')=="":
            messages.error(request,"Please insert message to send!")
            return render(request, 'product/details.html',context)

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
            item = request.POST.get('key')
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
    context = {
        'category':categories,
        'products':page,
        'all_count':all_count,
        'found_count':found_count,
        'brand':brands,
        'colors':colors,
        'min_tag':min_tag,
        'min_price1':min_pri,
        'max_price1':max_pri,
        'search_item': search_item
    }
    return render(request,'product/filter.html',context)
