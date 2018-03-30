# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0032_auto_20150628_0121'),
    ]

    operations = [
        migrations.AlterField(
            model_name='risk_analysis',
            name='threat',
            field=models.ForeignKey(verbose_name='\uc5f0\uad00 \ucf54\ub4dc', to='RiskManagement.Threat', null=True),
        ),
        migrations.AlterField(
            model_name='risk_analysis',
            name='vul',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \ucf54\ub4dc', to='RiskManagement.Vul_analysis', null=True),
        ),
    ]
