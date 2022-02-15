from curses.ascii import US
import channels
from django.core import validators
from django.db import models
from django.contrib.auth.models import User
from django.core.validators import *
from django.db.models.signals import post_save
from channels.layers import ChannelLayerManager, get_channel_layer
from asgiref.sync import async_to_sync
import json, random


class Profile(models.Model): #Model to create profile for users
    user = models.OneToOneField(User,null=True,on_delete=models.CASCADE,related_name='profile')
    username = models.CharField(max_length=20)
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=10)
    plan = models.CharField(max_length=20)
    district = models.CharField(max_length=30, default="Kathmandu")
    city = models.CharField(max_length=30, default="Baghbazar")
    profile_pic = models.FileField(upload_to='profiles', default='default.png')
    created_date = models.DateTimeField(auto_now_add=True)
    followers = models.ManyToManyField(User,blank=True,related_name='followers',default=[0])
    following = models.ManyToManyField(User,blank=True ,related_name ='following',default=[0])
    cover_pic = models.FileField(upload_to='covers', default='cover.jpg', blank=True, null=True)
    verified = models.BooleanField(default=False)
    desc = models.TextField(max_length=10000, blank=True, null=True)
    product_sold = models.IntegerField(default=0, blank=True, null=True)
    active = models.BooleanField(default=True, blank=True, null=True)
    balance = models.DecimalField(
        default=50,
        max_digits=12,
        decimal_places=2
    )


    def __str__(self):
        return self.firstname + " "+ self.lastname

def txn():
    return str(random.randint(1000000, 9999999))



class transaction(models.Model):
    txn_id = models.IntegerField(default=txn)
    # sender = models.CharField(max_length=50)
    sender = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name="sender")
    # receiver = models.CharField(max_length=50)
    receiver = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name="reciver")
    amount = models.DecimalField(default=0,max_digits=11,decimal_places=2)