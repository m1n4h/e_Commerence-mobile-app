from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Post, BlogUser  # make sure BlogUser is imported
from django.utils import timezone
import uuid

# Create your views here.


def home_page(request):
    """ This view retrieves all posts to be displayed to users"""
    context = dict()
    
    posts = Post.objects.filter(published = True)# task retrieve

    context['total'] = len(posts) # task countr

    context['posts'] = posts

    return render(request, 'home_page.html', context)



def create_post(request: HttpRequest):

    context = dict()

    if request.method == "POST":

        data = request.POST

        title = data.get('title')
        minutes = data.get('minutes')
        body = data.get('body')
        published = data.get('published') == 'on'  # checkbox

        # Create Post instance
        post = Post.objects.create(
            title = title,
            author = request.user,
            minutes = minutes if minutes else None,
            body = body,
            published = published,
            created = timezone.now()
        )

        messages.success(request, "Post created successfully!")
        return redirect('home-page')  # change to your page

    return render(request, 'posts/create_post.html', context)

