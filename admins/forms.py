from django.forms import DateTimeInput, ModelForm
from notification.models import BroadcastNotification
from product.models import Category, Sub_Category,Brand,Color

class NotificationForm(ModelForm):
    class Meta:
        model = BroadcastNotification
        fields = ['message','broadcast_on']
        widgets = {
            'broadcast_on': DateTimeInput(attrs={'type': 'datetime-local'}),
        }


class CategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = "__all__"



class ColorForm(ModelForm):
    class Meta:
        model = Color
        fields = "__all__"


class BrandForm(ModelForm):
    class Meta:
        model = Brand
        fields = "__all__"