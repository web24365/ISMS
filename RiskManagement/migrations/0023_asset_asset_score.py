# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0022_auto_20150619_1140'),
    ]

    operations = [
        migrations.AddField(
            model_name='asset',
            name='asset_score',
            field=models.IntegerField(null=True, verbose_name='\uc790\uc0b0 \uc810\uc218'),
        ),
    ]
