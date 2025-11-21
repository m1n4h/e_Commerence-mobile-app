from django.contrib import admin
from .models import BlogUser

# Register your models here.
class BlogUserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'first_name', 'last_name', 'is_author']
    ordering = ['-date_joined']


admin.site.register(BlogUser, BlogUserAdmin)