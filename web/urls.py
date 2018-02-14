from django.conf.urls import url
from django.contrib.auth.views import login, logout
from . import views


urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^login/$', login, name="login", kwargs={'template_name': 'web/login.html'}),
    url(r'^logout/$', logout, name='logout', kwargs={'next_page': '/'}),
    url(r'^register/$', views.UserFormView.as_view(), name='register'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
]