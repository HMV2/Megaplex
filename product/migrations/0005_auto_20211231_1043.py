# Generated by Django 3.2.6 on 2021-12-31 04:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_auto_20211230_2100'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image1',
            field=models.ImageField(null=True, upload_to='product_images'),
        ),
        migrations.AlterField(
            model_name='product',
            name='image2',
            field=models.ImageField(null=True, upload_to='product_images'),
        ),
        migrations.AlterField(
            model_name='product',
            name='image3',
            field=models.ImageField(null=True, upload_to='product_images'),
        ),
        migrations.AlterField(
            model_name='product',
            name='picture',
            field=models.ImageField(upload_to='product_images'),
        ),
    ]