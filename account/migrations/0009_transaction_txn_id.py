# Generated by Django 3.2.6 on 2022-01-29 09:03

import account.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0008_remove_transaction_txn_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaction',
            name='txn_id',
            field=models.CharField(default=account.models.txn, max_length=16),
        ),
    ]
