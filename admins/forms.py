from django.forms import DateTimeInput, ModelForm
from notification.models import BroadcastNotification
from product.models import Category, Sub_Category

class NotificationForm(ModelForm):
    class Meta:
        model = BroadcastNotification
        fields = ['message','broadcast_on','title']
        widgets = {
            'broadcast_on': DateTimeInput(attrs={'type': 'datetime-local'}),
        }


class CategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = "__all__"

class SubcategoryForm(ModelForm):
    class Meta:
        model = Sub_Category
        fields = "__all__"