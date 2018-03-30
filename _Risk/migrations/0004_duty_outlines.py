# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('RiskMgmt', '0003_remove_duty_outlines'),
    ]

    operations = [
        migrations.AddField(
            model_name='duty',
            name='outlines',
            field=models.CharField(max_length=10, verbose_name='\uac1c\uc694')),
    ]
