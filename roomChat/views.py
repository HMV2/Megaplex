from django.shortcuts import render

def index(request):
    return render(request, 'roomChat/chat.html')

def room(request, room_name):
    return render(request, 'roomChat/room.html', {
        'room_name1': room_name,
        'room_name':"broadcast",
    })