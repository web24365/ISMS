# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0012_auto_20150619_0154'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vul_analysis',
            name='vul_score',
        ),
    ]
