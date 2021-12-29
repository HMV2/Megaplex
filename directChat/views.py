from django.http.response import HttpResponse, HttpResponseBadRequest
from django.shortcuts import redirect
from directChat.models import Chat_Message
from django.contrib.auth.decorators import login_required
from django.template import loader
from django.contrib.auth.models import User


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
		'directs': directs,
		'messages': messages,
		'active_direct': active_direct,
		}

	template = loader.get_template('directChat/direct.html')

	return HttpResponse(template.render(context, request))

@login_required
def Directs(request, username):
	user = request.user
	messages = Chat_Message.get_messages(user=user)
	active_direct = username
	directs = Chat_Message.objects.filter(user=user, recipient=username)
	directs.update(is_read=True)

	for message in messages:
		if message['user'].username == username:
			message['unread'] = 0
		
		context = {
		'directs': directs,
		'messages': messages,
		'active_direct': active_direct,
		}

	template = loader.get_template('directChat/direct.html')

	return HttpResponse(template.render(context, request))



@login_required
def SendDirect(request):
	from_user = request.user
	to_user_username = request.POST.get('to_user')
	print("User Name: "+to_user_username)
	body = request.POST.get('body')
	
	if request.method == 'POST':
		try:
			to_user = User.objects.get(username=to_user_username)
		except:
			to_user = User.objects.get(id=request.POST.get('to_user'))
		Chat_Message.send_message(from_user, to_user, body)
		return redirect('inbox')
	else:
		HttpResponseBadRequest()