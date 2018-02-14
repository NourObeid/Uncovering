from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver



# Create your models here.
class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
        default=timezone.now)
    published_date = models.DateTimeField(
        blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title

class Places(models.Model):
    name = models.CharField(max_length= 250)
    r_score = models.CharField(max_length= 250) #relevance score
    c_score = models.CharField(max_length= 250) # confidence score
    wikiId = models.CharField(max_length= 500) #wikiData ID


