# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Asset',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('asset_code', models.CharField(max_length=20)),
                ('asset_class', models.CharField(max_length=50, verbose_name='\uc790\uc0b0 \ubd84\ub958')),
                ('asset_name', models.CharField(max_length=50, verbose_name='\uc774\ub984')),
                ('use', models.CharField(max_length=50, verbose_name='\uc6a9\ub3c4')),
                ('cnt', models.IntegerField(default=1, verbose_name='\uc218\ub7c9')),
                ('model', models.CharField(max_length=50, verbose_name='\uae30\uc885')),
                ('made', models.CharField(max_length=50, verbose_name='\uc81c\uc870\uc5c5\uccb4')),
                ('os', models.CharField(max_length=50, verbose_name='OS')),
                ('version', models.CharField(max_length=50, verbose_name='Version')),
                ('ip', models.GenericIPAddressField(verbose_name='IP address')),
                ('mac', models.GenericIPAddressField(verbose_name='MAC address')),
                ('location', models.CharField(max_length=100, verbose_name='\uc704\uce58')),
                ('archive', models.CharField(max_length=50, verbose_name='\ubcf4\uad00\ud615\ud0dc')),
                ('confidential', models.IntegerField(default=1, verbose_name='Confidential')),
                ('integrity', models.IntegerField(default=1, verbose_name='Integrity')),
                ('availability', models.IntegerField(default=1, verbose_name='Availability')),
                ('text', models.TextField(verbose_name='\ube44\uace0')),
            ],
            options={
                'ordering': ['asset_code'],
                'verbose_name': '\uc790\uc0b0',
            },
        ),
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('corp_name', models.CharField(max_length=30, verbose_name='\ud68c\uc0ac \uc774\ub984')),
                ('biz_reg_no', models.CharField(max_length=30, verbose_name='\uc0ac\uc5c5\uc790\ub4f1\ub85d\ubc88\ud638')),
                ('address', models.CharField(max_length=100, verbose_name='\uc0ac\uc5c5\uc7a5 \uc18c\uc7ac\uc9c0')),
                ('established', models.DateField(verbose_name='\uac1c\uc5c5\uc77c')),
                ('biz_type', models.CharField(max_length=30, verbose_name='\uc5c5\ud0dc')),
                ('representative', models.CharField(max_length=30, verbose_name='\ub300\ud45c\uc790')),
                ('sales', models.IntegerField(verbose_name='\uc804\ub144\ub3c4 \ub9e4\ucd9c\uc561')),
            ],
            options={
                'verbose_name': '\ud68c\uc0ac',
            },
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('depart', models.CharField(max_length=30, verbose_name='\ubd80\uc11c')),
                ('desc', models.CharField(max_length=50, verbose_name='\uc9c1\ubb34')),
                ('corpinfo', models.ForeignKey(verbose_name='\ud68c\uc0ac', to='RiskMgmt.Company')),
            ],
            options={
                'ordering': ['depart'],
                'verbose_name': '\ubd80\uc11c',
            },
        ),
        migrations.CreateModel(
            name='Duty',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('duty', models.CharField(max_length=10, verbose_name='\uc9c1\ubb34')),
                ('outline', models.CharField(max_length=10, verbose_name='\uac1c\uc694')),
                ('desc', models.TextField(verbose_name='\uc9c1\ubb34 \uae30\uc220')),
            ],
            options={
                'ordering': ['duty'],
                'verbose_name': '\uc9c1\ubb34 \uae30\uc220\uc11c',
            },
        ),
        migrations.CreateModel(
            name='Mapping',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('mapping_code', models.CharField(max_length=20)),
            ],
            options={
                'ordering': ['mapping_code'],
                'verbose_name': '\ucde8\uc57d\uc810 \uc704\ud611 \uad00\uacc4\ubd84\uc11d',
            },
        ),
        migrations.CreateModel(
            name='Rating',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rating_code', models.CharField(max_length=10, verbose_name='\ub4f1\uae09')),
                ('rating_score', models.IntegerField(verbose_name='\ub4f1\uae09 \uc810\uc218')),
            ],
            options={
                'ordering': ['rating_code'],
                'verbose_name': '\ub4f1\uae09',
            },
        ),
        migrations.CreateModel(
            name='Risk_analysis',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('risk_code', models.CharField(max_length=20)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='update \ub0a0\uc9dc')),
                ('risk_score', models.CharField(max_length=50, verbose_name='\uc704\ud5d8 \uc810\uc218')),
                ('asset_code', models.ForeignKey(verbose_name='\uc790\uc0b0 \ucf54\ub4dc', to='RiskMgmt.Asset')),
                ('mapping_code', models.ForeignKey(verbose_name='\uc5f0\uad00 \ucf54\ub4dc', to='RiskMgmt.Mapping')),
            ],
            options={
                'ordering': ['risk_code'],
                'verbose_name': '\uc704\ud5d8 \ubd84\uc11d',
            },
        ),
        migrations.CreateModel(
            name='Risk_control',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('additional_control', models.TextField(verbose_name='\ucd94\uac00 \uc704\ud5d8 \uad00\ub9ac')),
                ('risk_code', models.ForeignKey(to='RiskMgmt.Risk_analysis')),
            ],
            options={
                'ordering': ['risk_code'],
                'verbose_name': '\uc704\ud5d8 \uad00\ub9ac',
            },
        ),
        migrations.CreateModel(
            name='Risk_mgmt',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('risk_mgmt_code', models.CharField(max_length=20)),
                ('action_code', models.CharField(max_length=20, verbose_name='\uc704\ud5d8 \ucf54\ub4dc')),
                ('action_desc', models.TextField(verbose_name='\uc704\ud5d8 \uad00\ub9ac')),
            ],
            options={
                'ordering': ['risk_mgmt_code'],
                'verbose_name': '\uc704\ud5d8 \uad00\ub9ac',
            },
        ),
        migrations.CreateModel(
            name='Staff',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name='\uc774\ub984')),
                ('position', models.CharField(max_length=30, verbose_name='\uc9c1\uae09')),
                ('location', models.CharField(max_length=100, verbose_name='\uc704\uce58')),
                ('staff_depart', models.ForeignKey(verbose_name='\ubd80\uc11c', to='RiskMgmt.Department')),
                ('staff_duty', models.ForeignKey(verbose_name='\uc9c1\ubb34', to='RiskMgmt.Duty')),
            ],
            options={
                'ordering': ['name'],
                'verbose_name': '\uc9c1\uc6d0',
            },
        ),
        migrations.CreateModel(
            name='Threat',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('threat_code', models.CharField(max_length=20)),
                ('threat_class', models.CharField(max_length=50, verbose_name='\uc704\ud611 \ubd84\ub958')),
                ('threat_type', models.CharField(max_length=50, verbose_name='\uc704\ud611 \uc720\ud615')),
                ('threat_entry', models.CharField(max_length=50, verbose_name='\uc704\ud611 \ub0b4\uc6a9')),
                ('threat_scenario', models.TextField(verbose_name='\uc704\ud611 \uc2dc\ub098\ub9ac\uc624')),
                ('threat_impact', models.CharField(max_length=10, verbose_name='\uc704\ud611 \uac15\ub3c4')),
                ('threat_frequency', models.CharField(max_length=10, verbose_name='\ubc1c\uc0dd \ube48\ub3c4')),
                ('threat_score', models.CharField(max_length=10, verbose_name='\uc704\ud611 \uc810\uc218')),
            ],
            options={
                'ordering': ['threat_code'],
                'verbose_name': '\uc704\ud611',
            },
        ),
        migrations.CreateModel(
            name='Vul_analysis',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('vul_analysis_code', models.CharField(max_length=20)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='update \ub0a0\uc9dc')),
                ('vul_results', models.CharField(max_length=50, verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \uacb0\uacfc')),
                ('asset_code', models.ForeignKey(verbose_name='\uc790\uc0b0 \ucf54\ub4dc', to='RiskMgmt.Asset')),
            ],
            options={
                'ordering': ['vul_analysis_code'],
                'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d',
            },
        ),
        migrations.CreateModel(
            name='Vulnerability',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('vul_code', models.CharField(max_length=20)),
                ('vul_class', models.CharField(max_length=50, verbose_name='\ucde8\uc57d\uc810 \ubd84\ub958')),
                ('vul_entry', models.CharField(max_length=50, verbose_name='\ucde8\uc57d\uc810 \uc720\ud615')),
                ('vul_desc', models.TextField(verbose_name='\ucde8\uc57d\uc810 \ub0b4\uc6a9')),
                ('vul_rating', models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ub4f1\uae09', to='RiskMgmt.Rating')),
            ],
            options={
                'ordering': ['vul_code'],
                'verbose_name': '\ucde8\uc57d\uc810',
            },
        ),
        migrations.AddField(
            model_name='vul_analysis',
            name='vul_code',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ucf54\ub4dc', to='RiskMgmt.Vulnerability'),
        ),
        migrations.AddField(
            model_name='risk_control',
            name='risk_mgmt_code',
            field=models.ForeignKey(verbose_name='\uc704\ud5d8 \ubd84\uc11d \ucf54\ub4dc', to='RiskMgmt.Risk_mgmt'),
        ),
        migrations.AddField(
            model_name='risk_analysis',
            name='vul_analysis_code',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \ucf54\ub4dc', to='RiskMgmt.Vul_analysis'),
        ),
        migrations.AddField(
            model_name='mapping',
            name='threat_code',
            field=models.ForeignKey(verbose_name='\uc704\ud611 \ucf54\ub4dc', to='RiskMgmt.Threat'),
        ),
        migrations.AddField(
            model_name='mapping',
            name='vul_code',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ucf54\ub4dc', to='RiskMgmt.Vulnerability'),
        ),
        migrations.AddField(
            model_name='asset',
            name='name',
            field=models.ForeignKey(verbose_name='\uad00\ub9ac\uc790', to='RiskMgmt.Staff'),
        ),
        migrations.AddField(
            model_name='asset',
            name='rating',
            field=models.ForeignKey(verbose_name='\ub4f1\uae09', to='RiskMgmt.Rating'),
        ),
    ]
