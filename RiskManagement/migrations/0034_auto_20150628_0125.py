# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0033_auto_20150628_0121'),
    ]

    operations = [
        migrations.AlterField(
            model_name='risk_analysis',
            name='asset',
            field=models.ForeignKey(verbose_name='\uc790\uc0b0 \ucf54\ub4dc', to='RiskManagement.Asset'),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='created',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc'),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='risk_score',
            field=models.FloatField(verbose_name='\uc704\ud5d8 \ubd84\uc11d \uacb0\uacfc'),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='threat',
            field=models.ForeignKey(verbose_name='\uc5f0\uad00 \ucf54\ub4dc', to='RiskManagement.Threat'),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='vul',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \ucf54\ub4dc', to='RiskManagement.Vul_analysis'),
        ),
    ]
