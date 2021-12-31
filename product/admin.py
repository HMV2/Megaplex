from django.contrib import admin
from .models import Brand
from .models import Category, Product
from .models import Sub_Category, Color
# Register your models here.

admin.site.register(Category)
admin.site.register(Sub_Category)
admin.site.register(Brand)
admin.site.register(Color)
admin.site.register(Product)