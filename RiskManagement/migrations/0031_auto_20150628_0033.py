# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0030_auto_20150628_0031'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='risk_control',
            name='updated',
        ),
        migrations.AddField(
            model_name='risk_analysis',
            name='created',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc', null=True),
        ),
        migrations.AddField(
            model_name='risk_analysis',
            name='risk_score',
            field=models.FloatField(null=True, verbose_name='\uc704\ud5d8 \ubd84\uc11d \uacb0\uacfc'),
        ),
    ]
