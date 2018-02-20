from django.db import models
from django.utils import timezone




# Create your models here.
class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    text = models.TextField()
    created_date = models.DateTimeField(
        default=timezone.now)
    published_date = models.DateTimeField(
        blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()


class Places(models.Model):
    name = models.CharField(max_length= 250)
    r_score = models.CharField(max_length= 250) #relevance score
    c_score = models.CharField(max_length= 250) # confidence score
    wikiId = models.CharField(max_length= 500) #wikiData ID


