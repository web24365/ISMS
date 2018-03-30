# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0002_auto_20150616_2051'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mapping',
            name='asset',
            field=models.ForeignKey(verbose_name='\uc790\uc0b0', to='RiskManagement.Asset'),
        ),
    ]
