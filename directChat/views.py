from django.http.response import HttpResponse, HttpResponseBadRequest
from django.shortcuts import redirect
from directChat.models import Chat_Message
from django.contrib.auth.decorators import login_required
from django.template import loader
from django.contrib.auth.models import User
from django.urls import reverse


# @login_required
def Inbox(request):
    messages = Chat_Message.get_messages(user=request.user)
    active_direct = None
    directs = None
    if messages:
        message = messages[0]
        active_direct = message['user'].username
        directs = Chat_Message.objects.filter(user=request.user, recipient=message['user'])
        directs.update(is_read=True)
        for message in messages:
            if message['user'].username == active_direct:
                message['unread'] = 0


    context = {
        'room_name':"broadcast",
        'directs': directs,
        'messages': messages,
        'active_direct': active_direct,
    }

    template = loader.get_template('directChat/direct.html')

    return HttpResponse(template.render(context, request))


def get_name(username):
    user =  User.objects.get(id=username)
    full_name = user.first_name + " "+ user.last_name
    return full_name

@login_required
def Directs(request, username):
    current_user = Chat_Message.objects.all()
    user = request.user
    messages = Chat_Message.get_messages(user=user)
    active_direct = username
    directs = Chat_Message.objects.filter(user=user, recipient=username)
    directs.update(is_read=True)

    for message in messages:
        if message['user'].username == username:
            message['unread'] = 0
        name = get_name(username)
        context = {
            'room_name':"broadcast",
            'directs': directs,
            'messages': messages,
            'active_direct': active_direct,
            'current_user': current_user,
            'user_full':name
        }

    template = loader.get_template('directChat/direct.html')
    return HttpResponse(template.render(context, request))


@login_required
def SendDirect(request):
    from_user = request.user
    to_user_username = request.POST.get('to_user')
    body = request.POST.get('body')

    if request.method == 'POST':
        try:
            to_user = User.objects.get(username=to_user_username)
        except:
            to_user = User.objects.get(id=request.POST.get('to_user'))
        Chat_Message.send_message(from_user, to_user, body)
        context={}
        context['user_full'] = get_name(to_user_username)
        return redirect(reverse('directs', kwargs={ 'username':to_user_username}))
    else:
        HttpResponseBadRequest()
