from unicodedata import name
from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('details/<int:product_id>', views.product_details, name='Details_page'),

    path('filter/', views.filter_page),
    path('<int:comment_id>/comment_like',views.like_toggle,name ='like'),
    path('<int:product_id>/like',views.ToggleProductlike,name ='like'),
    path('<int:product_id>/removeliked',views.RemoveFromLikedList,name='removefromlikelist')
]