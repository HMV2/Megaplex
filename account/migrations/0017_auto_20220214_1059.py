# Generated by Django 3.2.6 on 2022-02-14 05:14

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('account', '0016_merge_20220214_1053'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='transaction',
            name='sender',
        ),
        migrations.AddField(
            model_name='transaction',
            name='sender_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, related_name='sender', to='auth.user'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='transaction',
            name='receiver',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='reciver', to=settings.AUTH_USER_MODEL),
        ),
    ]
