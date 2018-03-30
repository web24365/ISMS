# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0028_risk_analysis_risk_score'),
    ]

    operations = [
        migrations.AddField(
            model_name='threat',
            name='threat_score',
            field=models.IntegerField(null=True, verbose_name='\uc704\ud611 \uc810\uc218'),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='risk_score',
            field=models.FloatField(null=True, verbose_name='\uc704\ud5d8 \ubd84\uc11d \uacb0\uacfc'),
        ),
        migrations.AlterField(
            model_name='vul_analysis',
            name='vul_score',
            field=models.FloatField(null=True, verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \uacb0\uacfc'),
        ),
    ]
