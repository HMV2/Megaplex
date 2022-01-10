from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('details/<int:product_id>', views.product_details, name='Details_page'),
    path('filter/', views.filter_page),
]