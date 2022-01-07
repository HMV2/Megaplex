from product.models import Product
from django.forms import ModelForm

class ProductForm(ModelForm):
    """Form for creating Product"""
    class Meta:
        model = Product
        fields = "__all__"