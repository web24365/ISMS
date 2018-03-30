# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('RiskManagement', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='vulnerability',
            old_name='category',
            new_name='subclass',
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='entry',
            field=models.CharField(max_length=50, verbose_name='\ucde8\uc57d\uc810 \uc694\uc57d'),
        ),
    ]
