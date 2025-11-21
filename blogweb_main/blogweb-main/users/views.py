from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate,logout
from django.contrib import messages
from django.contrib.auth.hashers import make_password
from django.http import HttpRequest
from users.models import BlogUser

# Create your views here.
def login_page(request: HttpRequest):
    context = dict()
    logout(request) # logout.

    if request.method == 'POST':
        data = request.POST
        username = data.get('username')
        password = data.get('password')

        user = authenticate(username = username, password = password)
        
        if user is not None:
            # exist
            login(request, user)
            messages.success(request, '<strong>User logged in Successfully</strong>')
            return redirect('home-page')
        context['is_invalid'] = True
    return render(request, 'users/login.html', context)


def logout_page(request: HttpRequest):
    logout(request) # logout.
    messages.warning(request, '<strong>User logged in Out</strong>')
    return redirect('login')


def signup_page(request: HttpRequest):
    context =  dict() # {}
    if request.method == "POST":
        data = request.POST

        first_name = data.get('first_name')
        last_name = data.get('last_name')
        username = data.get('username')
        password = data.get('password')

        user = BlogUser.objects.create(
            first_name = first_name,
            last_name = last_name,
            username = username,
            password = make_password(password)
        )
        login(request, user)
        messages.success(request, '<strong>User logged in Successfully</strong>')
        return redirect('home-page')
    return render(request, 'users/signup.html', context)