# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0004_auto_20150618_1630'),
    ]

    operations = [
        migrations.AddField(
            model_name='vul_analysis',
            name='vul_score',
            field=models.IntegerField(default=2, verbose_name='\ubd84\uc11d \uacb0\uacfc'),
            preserve_default=False,
        ),
    ]
