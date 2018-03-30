# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0031_auto_20150628_0033'),
    ]

    operations = [
        migrations.AlterField(
            model_name='risk_analysis',
            name='asset',
            field=models.ForeignKey(verbose_name='\uc790\uc0b0 \ucf54\ub4dc', to='RiskManagement.Asset', null=True),
        ),
    ]
