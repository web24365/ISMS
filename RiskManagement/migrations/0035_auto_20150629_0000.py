# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0034_auto_20150628_0125'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='vul_analysis',
            options={'ordering': ['vul'], 'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d'},
        ),
        migrations.RemoveField(
            model_name='risk_analysis',
            name='asset',
        ),
    ]
