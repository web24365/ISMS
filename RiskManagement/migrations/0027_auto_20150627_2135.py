# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0026_auto_20150619_1539'),
    ]

    operations = [
        migrations.RenameField(
            model_name='risk_analysis',
            old_name='threat_code',
            new_name='threat',
        ),
        migrations.RenameField(
            model_name='risk_analysis',
            old_name='vul_code',
            new_name='vul',
        ),
        migrations.AddField(
            model_name='mapping',
            name='threat',
            field=models.ForeignKey(verbose_name='\uc704\ud611', to='RiskManagement.Threat', null=True),
        ),
        migrations.AddField(
            model_name='mapping',
            name='vul',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810', to='RiskManagement.Vul_analysis', null=True),
        ),
    ]
