from django.forms import DateTimeInput, ModelForm
from notification.models import BroadcastNotification

class NotificationForm(ModelForm):
    class Meta:
        model = BroadcastNotification
        fields = ['message','broadcast_on']
        widgets = {
            'broadcast_on': DateTimeInput(attrs={'type': 'datetime-local'}),
        }