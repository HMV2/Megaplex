# Generated by Django 3.2.6 on 2022-01-16 14:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0003_alter_product_likes'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='likes',
        ),
    ]
