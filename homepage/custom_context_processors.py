from notification.models import BroadcastNotification

def notifications(request):
    allNotifications = BroadcastNotification.objects.filter(sent= True).order_by('-broadcast_on')[:4]
    return{'notifications':allNotifications}

    