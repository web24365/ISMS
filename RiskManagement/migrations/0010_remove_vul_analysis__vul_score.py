# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0009_vul_analysis__vul_score'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vul_analysis',
            name='_vul_score',
        ),
    ]
