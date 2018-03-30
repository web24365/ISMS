# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0018_auto_20150619_0228'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vul_analysis',
            name='vul_score',
        ),
        migrations.AddField(
            model_name='vul_analysis',
            name='_vul_score',
            field=models.IntegerField(null=True, verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \uacb0\uacfc', db_column=b'vul_score'),
        ),
    ]
