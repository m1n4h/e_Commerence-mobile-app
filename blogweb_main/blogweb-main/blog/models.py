import uuid
from django.db import models
from django.utils import timezone
from django.conf import settings
from users.models import BlogUser

# Create your models here.

class Post(models.Model):
    """ This saves the blog posts """ # docstrings """ """ # they add extra meaning to the code.
    id = models.UUIDField(default=uuid.uuid4, primary_key=True, editable=False)
    title = models.CharField(max_length=200, blank=True, null=True)
    author = models.ForeignKey(BlogUser, on_delete=models.SET_NULL, null=True)
    minutes = models.IntegerField(blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    published = models.BooleanField(default=False)
    created = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return str(self.title)
    
# models
# views 
# urls
# templates ::: css, html, bootstrap