# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0014_vul_analysis_vul_score'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='vul_analysis',
            options={'ordering': ['vul_code', 'vul_score'], 'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d'},
        ),
    ]
