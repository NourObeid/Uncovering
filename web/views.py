from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
# Create your views here.
def post_list(request):
    return render(request, 'web/home.html', {})

def index(request):
    template = loader.get_template('web/home.html')
    return HttpResponse('')