# Generated by Django 5.0.1 on 2024-06-06 09:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('wsite', '0018_productrating_description'),
    ]

    operations = [
        migrations.RenameField(
            model_name='productrating',
            old_name='description',
            new_name='comment',
        ),
    ]