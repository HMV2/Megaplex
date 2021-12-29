
from django.contrib import admin
from django.urls import path
from django.conf.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('homepage.urls')),
    path('account/',include('account.urls')),
    path('chat/',include('directChat.urls'))
]
