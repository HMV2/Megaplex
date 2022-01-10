from notification.models import BroadcastNotification
def notifications(request):
    allNotifications = BroadcastNotification.objects.all()
    return{'notifications':allNotifications}