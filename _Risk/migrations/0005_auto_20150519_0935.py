# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskMgmt', '0004_duty_outlines'),
    ]

    operations = [
        migrations.AlterField(
            model_name='staff',
            name='staff_duty',
            field=models.CharField(max_length=30, verbose_name='\uc9c1\ubb34'),
        ),
        migrations.DeleteModel(
            name='Duty',
        ),
    ]
