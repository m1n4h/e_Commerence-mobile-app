import uuid
from django.db import models
from django.contrib.auth.models import AbstractUser # AbstractBaseUser

# Create your models here.
class BlogUser(AbstractUser):
    id = models.UUIDField(default=uuid.uuid4, primary_key=True, editable=False)
    is_author = models.BooleanField(default=False)
    # first_name , .....

    def __str__(self):
        return self.username
    
    class Meta:      
        verbose_name_plural = "Blog Users"