from rest_framework import serializers
from .models import BlogUser


class BlogUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogUser
        fields = ['id', 'username', 'email', 'first_name', 'last_name', 'is_author']

