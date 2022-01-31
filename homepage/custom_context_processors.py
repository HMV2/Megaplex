from notification.models import BroadcastNotification
from directChat.models import Chat_Message

def notifications(request):
    allNotifications = BroadcastNotification.objects.all()
    return{'notifications':allNotifications}

def get_unread(request):
    count = 0
    if request.user.is_authenticated:
        messages = Chat_Message.get_messages(user=request.user)
        for i in messages:
            if i['unread']==1:
                count+=1
    return str(count)
    