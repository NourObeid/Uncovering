from django import forms
from .models import Post
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


class UploadFileForm(forms.Form):
    file = forms.FileField()


class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ( 'text',)


class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model = User
        fields = ('username', 'email','password')


            # Documentation: https://docs.djangoproject.com/en/2.0/topics/http/file-uploads/
