# Generated by Django 2.0.2 on 2018-02-12 21:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0002_profile'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='user',
        ),
        migrations.DeleteModel(
            name='Profile',
        ),
    ]
