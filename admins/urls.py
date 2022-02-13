from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('send_notification/',views.send_notification,name='send_notification'),
    path('add_category/',views.add_category,name='add_category'),
    path('add_subcategory/',views.add_subcategory,name='add_subcategory'),

    path('<int:category_id>/edit_category',views.edit_category,name='edit_category'),
    path('activate/<int:id>', views.active),
    path('deactivate/<int:id>', views.deactive),
    path('verify/<int:id>', views.verify),
    path('unverify/<int:id>', views.unverify),
    path('deleteSub/<int:id>', views.deleteSub),
    path('deleteCat/<int:id>', views.deleteCat),
    path('logout', views.logout_user)
]