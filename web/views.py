from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def post_list(request):
    return render(request, 'web/home.html', {})

def index(request):
    return HttpResponse("Home")