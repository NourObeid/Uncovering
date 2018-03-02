from django.contrib.auth import get_user_model
from django.test import TestCase
from django.utils import timezone
from web.models import Post
from web.forms import UserForm
from web.forms import PostForm
from django.contrib.auth.models import AnonymousUser, User



""" 
1.Unit tests
Verify functional behavior of individual components, often to class and function level.
2.Regression tests
Tests that reproduce historic bugs. Each test is initially run to verify that the bug has been fixed, and then re-run to ensure that it has not been reintroduced following later changes to the code.
3.Integration tests
Verify how groupings of components work when used together. Integration tests are aware of the required interactions between components, but not necessarily of the internal operations of each component. They may cover simple groupings of components through to the whole website.
"""


class WebTestCase(TestCase):
    @classmethod
    def setUp(self):
        self.user = User.objects.create_user(
            username='jacob', email='jacob@…', password='top_secret')

        Post.objects.create(author_id="123",
                            text="During  the  initial weeks  of  the  War,  his  Exalted  Highness  the Nizam  of  Hyderabad  contributed  E-s.  6,000,000  (£400,000)  and  his Highness  the  Maharaja  of  Mysore  gave  Es.  5,000,000  (£333,333). In  the  fourth  year  of  the,struggle  these  gifts  still  head  the  list  of individual  cdntribntions  to  the  war-chest. ",
                            created_date=timezone.now(), published_date=timezone.now(), )

    def test_text_correctly(self):
        """Animals that can speak are correctly identified"""
        post = Post.objects.get(id=1)
        self.assertEqual(post.text,
                         "During  the  initial weeks  of  the  War,  his  Exalted  Highness  the Nizam  of  Hyderabad  contributed  E-s.  6,000,000  (£400,000)  and  his Highness  the  Maharaja  of  Mysore  gave  Es.  5,000,000  (£333,333). In  the  fourth  year  of  the,struggle  these  gifts  still  head  the  list  of individual  cdntribntions  to  the  war-chest. ")


class PostFormTest(TestCase):
    @classmethod
    def setUp(self):
        user = get_user_model().objects.create_user('zoidberg')
        self.Post = Post.objects.create(author=user)

    def test_init(self):
        PostForm(self.Post)

    def test_init_without_post(self):
        with self.assertRaises(KeyError):
            PostForm()

    def test_valid_data(self):
        form = PostForm({
            'text': "All  India  rallied  to  the  British  cause-—Indian  India,  held  and ruled  by  Indians,  as  well  as  British  India,  administered  by  the British.  j  n ",
        },self)
        self.assertTrue(form.is_valid())
        text = form.save()
        self.assertEqual(text.name, "All  India  rallied  to  the  British  cause-—Indian  India,  held  and ruled  by  Indians,  as  well  as  British  India,  administered  by  the British.  j  n ")
        self.assertEqual(text.Post, self.Post)

    def test_blank_data(self):
        form = PostForm({}, Post=self.Post)
        self.assertFalse(form.is_valid())
        self.assertEqual(form.errors, {
            'text': ['required'],
        })

