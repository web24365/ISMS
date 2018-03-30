# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskMgmt', '0002_auto_20150519_0912'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='duty',
            name='outlines',
        ),
    ]
