# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0011_vul_analysis_vul_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='vul_analysis',
            name='vul_score',
            field=models.IntegerField(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \uacb0\uacfc'),
        ),
    ]
