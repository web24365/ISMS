# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0017_auto_20150619_0210'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='vul_analysis',
            options={'ordering': ['asset'], 'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d'},
        ),
        migrations.RenameField(
            model_name='vul_analysis',
            old_name='vul_code',
            new_name='vul',
        ),
    ]
