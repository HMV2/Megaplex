from django.shortcuts import render
from directChat.views import get_unread

def index(request):
    return render(request, 'roomChat/chat.html')

def room(request, room_name):
    return render(request, 'roomChat/room.html', {
        'room_name1': room_name,
        'room_name':"broadcast",
        'get_unread':get_unread(request)
    })