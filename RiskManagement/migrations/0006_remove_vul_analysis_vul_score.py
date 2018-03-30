# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0005_vul_analysis_vul_score'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vul_analysis',
            name='vul_score',
        ),
    ]
