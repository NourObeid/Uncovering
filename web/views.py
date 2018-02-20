from django.utils import timezone
from django.shortcuts import render, redirect,get_object_or_404
from django.http import HttpResponse
from django.template import loader
from django.contrib.auth import authenticate
from web.models import Post
from .forms import PostForm
from django.views.generic import View
from .forms import UserForm
import textrazor
from wikidata.client import Client





# Create your views here.

def index(request):
    return render(request, 'web/index.html', {})
def animation(request):
    return render(request, 'web/animation.html', {})

def post_detail(request, pk, en):
    post = get_object_or_404(Post, pk=pk)
    en.sort(key=lambda x: x.relevance_score, reverse=True)
    search_results = {}
    search_result = {}
    seen = set()
    seenID = set()
    for entity in en:
        if entity.id not in seen:
            counter = 0
            for enti in en:
                if entity.id == enti.id:
                    counter += 1
            search_result={entity.id, counter, entity.relevance_score, entity.confidence_score, entity.freebase_types}
            search_results.append(search_result)
            seen.add(entity.id)
            seenID.add
    return render(request, 'web/post_detail.html', {'post': post,'results':search_results})


def post_new(request):

    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            """implement the textRazor service"""
            textrazor.api_key = "229bd8d857455aeb31844f8abbfff313720ef0d4b5e2c5cb694e95d0"
            """find the places"""
            client = textrazor.TextRazor(extractors=["entities", "topics"])
            client.set_entity_freebase_type_filters(["/location/location"])
            client.set_entity_dbpedia_type_filters(["Place"])
            """making the table"""
            response = client.analyze(post.text)
            search_results = []
            search_result = ()
            seen = []
            seenID = []
            entities = list(response.entities())
            """alphabetical order the entities"""
            entities.sort(key=lambda x: x.id)
            for entity in entities:
                if entity.id not in seen:
                    counter = 0
                    """count the occurences of the place names"""
                    for enti in entities:
                        if entity.id == enti.id:
                            counter += 1
                    search_result = (entity.id, counter, entity.relevance_score, entity.confidence_score,
                                     entity.wikidata_id, entity.wikipedia_link)
                    search_results.append(search_result)
                    seen.append(entity.id)
                    seenID.append(entity.wikidata_id)
            """extracing the sentences"""
            txt = post.text
            sentences=[]
            seen.sort(key=str.lower)

            for ele in seen:
                """for each place name, split the text into sentences
                each time with a successful locating, make a new set to store the placename and the sentencen
                finally store the set in a new big set"""
                for sentence in txt.split('.'):
                    if ele in sentence:
                        s=(ele,sentence)
                        sentences.append(s)
            search_results.sort(key=lambda x: x[1], reverse=True)
            """Get the information from wikidata including the description, coordinate location, country,capital,also known as"""
            description=[]



            """Google api key:AIzaSyAEUeH5mDNsTQO3OPor0XUq9ConykXpU_c"""



            return render(request,'web/post_results.html', {'post': post,'results':search_results,'sentences':sentences})
    else:
        form = PostForm()
    return render(request, 'web/post_edit.html', {'form': form})


def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'web/post_edit.html', {'form': form})


def logout(request):
    logout(request)
    return render(request, 'web/login.html')


class UserFormView(View):
    form_class = UserForm
    template_name = "web/register.html"

    def get(self,request):
        form = self.form_class(None)
        return render(request, self.template_name, {'form':form})

    def post(self,request):
        form = self.form_class(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            #Cleaned (normalized) data
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user.set_password(password)
            user.save()
            posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
            return render(request, 'web/index.html', {'posts': posts})
        return render(request, self.template_name,{'form':form})




