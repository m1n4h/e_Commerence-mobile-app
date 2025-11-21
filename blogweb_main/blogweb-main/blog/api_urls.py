from django.urls import path
from . import apis


urlpatterns = [
    path('posts/', apis.all_posts),
    path('post/create/', apis.create_post)
]