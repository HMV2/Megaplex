# Generated by Django 3.2.6 on 2022-02-14 07:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0018_rename_sender_id_transaction_sender'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='balance',
            field=models.DecimalField(decimal_places=2, default=50, max_digits=12),
        ),
    ]
