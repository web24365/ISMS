# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0024_auto_20150619_1456'),
    ]

    operations = [
        migrations.AddField(
            model_name='vul_analysis',
            name='isapplied',
            field=models.IntegerField(null=True, verbose_name='\uc801\uc6a9 \uc5ec\ubd80', choices=[(1, b'\xec\xb7\xa8\xec\x95\xbd'), (0.5, b'\xec\x9d\xbc\xeb\xb6\x80 \xec\xb7\xa8\xec\x95\xbd'), (0, b'\xec\x96\x91\xed\x98\xb8')]),
        ),
    ]
