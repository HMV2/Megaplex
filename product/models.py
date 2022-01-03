from django.db import models
from django.db.models.base import Model
from django.contrib.auth.models import User

WARRANTY_CHOICES = (
    ("None", "None"),
    ("1 Year","1 Year"),
    ("2 Years","2 Years"),
    ("3 Years","3 Years"),
    ("4 Years","4 Years"),
    ("5 Years","5 Years")
)

class Category(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self) -> str:
        return self.name

class Sub_Category(models.Model):
    name = models.CharField(max_length=200)
    category = models.ForeignKey(Category,on_delete=models.CASCADE)


    def __str__(self) -> str:
        return self.name

class Brand(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self) -> str:
        return self.name

class Color(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self) -> str:
        return self.name


class Product(models.Model):
    name = models.CharField(max_length=200)
    picture = models.ImageField(upload_to = 'product_images')
    price = models.FloatField()
    image1 = models.ImageField(upload_to = 'product_images', null=True)
    image2 = models.ImageField(upload_to = 'product_images', null=True)
    image3 = models.ImageField(upload_to = 'product_images', null=True)
    date = models.DateField(auto_now_add=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_category = models.ForeignKey(Sub_Category, on_delete = models.CASCADE) 
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    color = models.ForeignKey(Color, on_delete=models.DO_NOTHING)
    warranty = models.CharField(max_length=100,choices=WARRANTY_CHOICES, default="None")
    description = models.TextField()
    specifications = models.TextField()
    seller = models.ForeignKey(User, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    is_active = models.BooleanField(default=True)


    def __str__(self) -> str:
        return self.name


