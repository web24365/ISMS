# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskMgmt', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='duty',
            old_name='outline',
            new_name='outlines',
        ),
    ]
