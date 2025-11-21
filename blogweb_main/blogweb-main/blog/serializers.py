from rest_framework import serializers
from users.serializers import BlogUserSerializer
from .models import Post


class PostSerializer(serializers.ModelSerializer):
    author = BlogUserSerializer(read_only=True)

    class Meta:
        model = Post
        fields = ['id', 'title', 'author', 'minutes', 'body', 'published', 'created']
