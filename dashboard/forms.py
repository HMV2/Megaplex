from product.models import Product
from django.forms import ModelForm
from django import forms

class ProductForm(ModelForm):
    """Form for creating Product"""

    description = forms.CharField(
        label='description',
        widget=forms.Textarea(attrs={
            'rows':'3',
            'placeholder':''
        })
    )

    specifications = forms.CharField(
        label='specifications',
        widget=forms.Textarea(attrs={
            'rows':'3',
            'placeholder':''
        })
    )
    class Meta:
        model = Product
        fields = "__all__"