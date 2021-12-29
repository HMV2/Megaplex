from django.urls import path
from directChat.views import Inbox, Directs, SendDirect
urlpatterns = [
   	path('', Inbox, name='inbox'),
	path('directs/<username>',Directs, name='directs'),
	path('send/',SendDirect, name='send_direct'),
]