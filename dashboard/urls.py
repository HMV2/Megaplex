from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('profile/', views.profile, name='profile'),
    path('profile/<int:profile_id>',views.User_Profile,name='user_profile'),
    path('follow_user/<int:profile_id>',views.AddFollowers,name ='follow'),
    path('unfollow_user/<int:profile_id>',views.RemoveFollowers,name='unfollow'),
    path('follower_list/<int:profile_id>',views.follower_list,name='following_list'),
    path('remove_follower/<int:follower_id>',views.Delete_Follower,name='Remove_following_user'),
    path('toggle_following/<int:following_id>',views.togglefollowing,name='toggle_following_user'),
    path('addProduct/', views.addProduct, name="addProduct"),
    path('editProduct/<int:product_id>', views.editProduct, name="editProduct"),
    path('removeProduct/<int:product_id>', views.remove_product, name="removeProduct"),
    path('wishlist/',views.wishlist,name='wishlist'),
    path('wallet/',views.wallet,name='wallet'),
    path('mark_sold/<int:product_id>',views.mark_sold),
    path('mark_unsold/<int:product_id>',views.mark_unsold),
    path('set_online/<int:id>',views.set_online),
    path('set_offline/<int:id>',views.set_offline),

]