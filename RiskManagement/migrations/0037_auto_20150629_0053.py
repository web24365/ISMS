# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0036_auto_20150629_0038'),
    ]

    operations = [
        migrations.AlterField(
            model_name='risk_analysis',
            name='threat',
            field=models.ForeignKey(verbose_name='\uad00\ub828 \uc704\ud611', to='RiskManagement.Threat'),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='vul',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d', to='RiskManagement.Vul_analysis'),
        ),
    ]
