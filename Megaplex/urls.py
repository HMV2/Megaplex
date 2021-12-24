
from django.contrib import admin
from django.urls import path
from django.conf.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('homepage.urls')),
    path('accounts/', include('accounts.urls')),
    path('auth_accounts/', include('allauth.urls'))
]
