# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0035_auto_20150629_0000'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='risk_analysis',
            options={'ordering': ['vul'], 'verbose_name': '\uc704\ud5d8 \ubd84\uc11d'},
        ),
        migrations.AlterModelOptions(
            name='vul_analysis',
            options={'ordering': ['asset'], 'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d'},
        ),
        migrations.RemoveField(
            model_name='risk_analysis',
            name='risk_code',
        ),
    ]
