# Generated by Django 3.2.6 on 2022-01-29 09:23

import account.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0011_alter_transaction_txn_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transaction',
            name='txn_id',
            field=models.IntegerField(default=account.models.txn),
        ),
    ]
