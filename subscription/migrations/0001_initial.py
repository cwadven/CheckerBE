# Generated by Django 4.1.10 on 2024-12-30 05:23
import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('map', '0002_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='MapSubscription',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_deleted', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True, db_index=True, help_text='구독 시작 시각')),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('map', models.ForeignKey(help_text='구독한 Map', on_delete=django.db.models.deletion.DO_NOTHING, related_name='subscriptions', to='map.map')),
                ('member', models.ForeignKey(help_text='구독한 사용자', on_delete=django.db.models.deletion.DO_NOTHING, related_name='map_subscriptions', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Map 구독',
                'verbose_name_plural': 'Map 구독',
            },
        ),
    ]
