# Generated by Django 3.2.6 on 2022-01-29 08:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0007_alter_transaction_txn_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='transaction',
            name='txn_id',
        ),
    ]
