# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0029_auto_20150627_2218'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='risk_analysis',
            name='created',
        ),
        migrations.RemoveField(
            model_name='risk_analysis',
            name='risk_score',
        ),
        migrations.RemoveField(
            model_name='risk_analysis',
            name='updated',
        ),
    ]
