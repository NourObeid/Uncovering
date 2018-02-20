from django.test import TestCase
from web.models import Post
from django.utils import timezone

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
        Post.objects.create(author="dennis", text="During  the  initial weeks  of  the  War,  his  Exalted  Highness  the Nizam  of  Hyderabad  contributed  E-s.  6,000,000  (£400,000)  and  his Highness  the  Maharaja  of  Mysore  gave  Es.  5,000,000  (£333,333). In  the  fourth  year  of  the,struggle  these  gifts  still  head  the  list  of individual  cdntribntions  to  the  war-chest. ",create_date=timezone.now(),published_date=timezone.now(),)
        Post.objects.create(name="cat", sound="meow")

    def test_text_correctly(self):
        """Animals that can speak are correctly identified"""
        post = Post.objects.get(author="dennis")
        self.assertEqual(lion.speak(), 'The lion says "roar"')
        self.assertEqual(cat.speak(), 'The cat says "meow"')