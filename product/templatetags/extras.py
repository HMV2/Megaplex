from django import template
from numpy import product
from product.models import Sub_Category,Product

register = template.Library()

@register.filter(name='get_val')
def get_val(dict, key):
    return dict.get(key)


@register.filter(name='categories')
def categories( value):
    sub_category = Sub_Category.objects.filter(category=value)
    return sub_category

@register.filter(name='Product_count')
def Product_count( value):
    product_count = Product.objects.filter(category=value).count()
    return product_count


@register.filter(name='SubCategory_count')
def SubCategory_count(value):
    product_count = Product.objects.filter(sub_category=value).count()
    return product_count

@register.filter(name='brand_count')
def brand_count(value):
    product_count = Product.objects.filter(brand=value).count()
    return product_count

@register.filter(name='color_count')
def color_count(value):
    product_count = Product.objects.filter(color=value).count()
    return product_count