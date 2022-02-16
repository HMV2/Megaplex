from django.db import models
from django.db.models.base import Model
from django.contrib.auth.models import User
from django.utils.timezone import now

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
    picture = models.ImageField(upload_to = 'category_images', default="def.jpeg")

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
    picture = models.ImageField(upload_to = 'product_images', default="def.jpeg")
    price = models.FloatField()
    image1 = models.ImageField(upload_to = 'product_images')
    image2 = models.ImageField(upload_to = 'product_images')
    image3 = models.ImageField(upload_to = 'product_images')
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
    view_count = models.IntegerField(default=0)
    product_likes = models.ManyToManyField(User,blank = True , related_name = 'product_likes')


    def __str__(self) -> str:
        return self.name



class Comment(models.Model):
    sno = models.AutoField(primary_key=True)
    comment_text = models.TextField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True)
    timestamp = models.DateTimeField(default=now)
    likes = models.ManyToManyField(User,blank = True , related_name = 'likes') 