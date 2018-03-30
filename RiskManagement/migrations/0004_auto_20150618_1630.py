# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0003_auto_20150617_2038'),
    ]

    operations = [
        migrations.AlterField(
            model_name='asset',
            name='asset_code',
            field=models.CharField(unique=True, max_length=20, verbose_name='\uc790\uc0b0 \ucf54\ub4dc'),
        ),
    ]
