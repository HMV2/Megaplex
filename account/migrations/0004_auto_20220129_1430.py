# Generated by Django 3.2.6 on 2022-01-29 08:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0003_auto_20220129_1422'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='username',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='transaction',
            name='txn_id',
            field=models.CharField(default=8391534828514243, max_length=16),
        ),
    ]
