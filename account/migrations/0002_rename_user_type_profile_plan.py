# Generated by Django 3.2.9 on 2021-12-10 15:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profile',
            old_name='user_type',
            new_name='plan',
        ),
    ]
