# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0027_auto_20150627_2135'),
    ]

    operations = [
        migrations.AddField(
            model_name='risk_analysis',
            name='risk_score',
            field=models.IntegerField(null=True, verbose_name='\uc704\ud5d8 \ubd84\uc11d \uacb0\uacfc'),
        ),
    ]
