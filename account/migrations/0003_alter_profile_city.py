# Generated by Django 3.2.9 on 2021-12-10 15:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0002_rename_user_type_profile_plan'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='city',
            field=models.CharField(default='Baghbazar', max_length=30),
        ),
    ]
