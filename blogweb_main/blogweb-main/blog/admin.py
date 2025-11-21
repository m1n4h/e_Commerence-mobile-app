from django.contrib import admin
from .models import Post

# Register your models here.

class PostAdmin(admin.ModelAdmin):
    list_display = ['id', 'author', 'published', 'minutes', 'title', 'created']
    ordering = ['-created']

admin.site.register(Post, PostAdmin)