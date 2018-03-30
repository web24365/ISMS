# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0016_auto_20150619_0208'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='vul_analysis',
            options={'ordering': ['vul_code'], 'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d'},
        ),
        migrations.AlterField(
            model_name='vul_analysis',
            name='vul_score',
            field=models.IntegerField(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \uacb0\uacfc'),
        ),
    ]
