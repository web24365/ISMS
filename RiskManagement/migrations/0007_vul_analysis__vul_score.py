# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0006_remove_vul_analysis_vul_score'),
    ]

    operations = [
        migrations.AddField(
            model_name='vul_analysis',
            name='_vul_score',
            field=models.IntegerField(default=1, verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \uacb0\uacfc', db_column=b'vul_score'),
            preserve_default=False,
        ),
    ]
