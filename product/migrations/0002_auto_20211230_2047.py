# Generated by Django 3.2.6 on 2021-12-30 15:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='brand',
            name='brand_id',
        ),
        migrations.RemoveField(
            model_name='category',
            name='cat_id',
        ),
        migrations.RemoveField(
            model_name='color',
            name='color_code',
        ),
        migrations.RemoveField(
            model_name='product',
            name='product_id',
        ),
        migrations.RemoveField(
            model_name='sub_category',
            name='sub_id',
        ),
    ]
