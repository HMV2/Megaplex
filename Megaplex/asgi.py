"""
ASGI config for Megaplex project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/howto/deployment/asgi/
"""

import os

from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
import django
from channels.auth import AuthMiddlewareStack
from notification.routing import websocket_urlpatterns
from roomChat.routing import websocket_urlpatterns as second_pattern


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Megaplex.settings')
django.setup()



application = ProtocolTypeRouter({
    'http':get_asgi_application(),
    'websocket':AuthMiddlewareStack(
        URLRouter(
            websocket_urlpatterns + second_pattern
            )
        
        )
})