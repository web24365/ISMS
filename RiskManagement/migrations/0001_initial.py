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
                ('asset_code', models.CharField(max_length=20, verbose_name='\uc790\uc0b0 \ucf54\ub4dc')),
                ('asset_class', models.CharField(max_length=8, verbose_name='\uc790\uc0b0 \ubd84\ub958', choices=[(b'Info', b'\xec\xa0\x95\xeb\xb3\xb4'), (b'Network', b'\xeb\x84\xa4\xed\x8a\xb8\xec\x9b\x8c\xed\x81\xac'), (b'Security', b'\xec\xa0\x95\xeb\xb3\xb4\xeb\xb3\xb4\xed\x98\xb8\xec\x8b\x9c\xec\x8a\xa4\xed\x85\x9c'), (b'OS', b'Operating System'), (b'SW', b'\xec\x86\x8c\xed\x94\x84\xed\x8a\xb8\xec\x9b\xa8\xec\x96\xb4'), (b'HW', b'\xeb\xac\xbc\xeb\xa6\xac\xec\xa0\x81 \xec\x9e\x90\xec\x82\xb0')])),
                ('asset_name', models.CharField(max_length=50, verbose_name='\uc774\ub984', blank=True)),
                ('use', models.CharField(max_length=50, verbose_name='\uc6a9\ub3c4', blank=True)),
                ('cnt', models.IntegerField(default=1, verbose_name='\uc218\ub7c9', blank=True)),
                ('model', models.CharField(max_length=50, verbose_name='\uae30\uc885(model \uba85)', blank=True)),
                ('made', models.CharField(max_length=50, verbose_name='\uc81c\uc870\uc5c5\uccb4', blank=True)),
                ('url', models.URLField(max_length=100, verbose_name='URL', blank=True)),
                ('os', models.CharField(max_length=50, verbose_name='OS', blank=True)),
                ('version', models.CharField(max_length=50, verbose_name='Version', blank=True)),
                ('ip', models.GenericIPAddressField(null=True, verbose_name='IP address', blank=True)),
                ('mac', models.CharField(max_length=50, verbose_name='MAC address', blank=True)),
                ('location', models.CharField(max_length=100, verbose_name='\uc704\uce58', blank=True)),
                ('archive', models.CharField(max_length=50, verbose_name='\ubcf4\uad00\ud615\ud0dc', blank=True)),
                ('confidential', models.IntegerField(blank=True, verbose_name='Confidential', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
                ('integrity', models.IntegerField(blank=True, verbose_name='Integrity', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
                ('availability', models.IntegerField(blank=True, verbose_name='Availability', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
                ('text', models.TextField(verbose_name='\ube44\uace0', blank=True)),
            ],
            options={
                'ordering': ['asset_class', 'asset_name'],
                'verbose_name': '\uc790\uc0b0',
            },
        ),
        migrations.CreateModel(
            name='Asset_valuation',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('valuation_code', models.CharField(max_length=10)),
                ('cia', models.CharField(max_length=1, verbose_name='\ud3c9\uac00 \uae30\uc900', choices=[(b'C', b'Confidential'), (b'I', b'Integrity'), (b'A', b'Availability')])),
                ('rating', models.IntegerField(verbose_name='\uad6c\ubd84', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
                ('desc', models.CharField(max_length=200, verbose_name='\uc0c1\uc138 \ub0b4\uc6a9')),
            ],
            options={
                'ordering': ['cia'],
                'verbose_name': '\uc790\uc0b0 \ud3c9\uac00\uae30\uc900',
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
                ('desc', models.CharField(max_length=50, verbose_name='\uc8fc\uc694 \uc5c5\ubb34')),
                ('corpinfo', models.ForeignKey(verbose_name='\ud68c\uc0ac', to='RiskManagement.Company')),
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
                ('duty', models.CharField(max_length=20, verbose_name='\uc9c1\ubb34')),
                ('outline', models.CharField(max_length=100, verbose_name='\uac1c\uc694')),
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
                ('asset', models.ForeignKey(verbose_name='\uc790\uc0b0 \ucf54\ub4dc', to='RiskManagement.Asset')),
            ],
            options={
                'ordering': ['mapping_code'],
                'verbose_name': '\uc790\uc0b0\uacfc \uc704\ud611 \uc0c1\uad00 \uad00\uacc4 \ubd84\uc11d',
            },
        ),
        migrations.CreateModel(
            name='Partner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name='\ud68c\uc0ac\uba85')),
                ('outline', models.CharField(max_length=30, verbose_name='\uc8fc\uc694 \uc5c5\ubb34')),
                ('desc', models.CharField(max_length=200, verbose_name='\uc0c1\uc138 \ub0b4\uc5ed')),
            ],
        ),
        migrations.CreateModel(
            name='Risk_analysis',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('risk_code', models.CharField(max_length=20)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='update \ub0a0\uc9dc')),
                ('asset', models.ForeignKey(verbose_name='\uc790\uc0b0 \ucf54\ub4dc', to='RiskManagement.Asset')),
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
                ('control_item', models.CharField(max_length=50, verbose_name='\ud1b5\uc81c \ud56d\ubaa9', blank=True)),
                ('risk_action', models.CharField(default=b'acceptance', max_length=20, verbose_name='\uc704\ud5d8 \ub300\uc751 \ubc29\uc548', choices=[(b'acceptance', b'\xec\x9c\x84\xed\x97\x98 \xec\x88\x98\xec\x9a\xa9'), (b'reduction', b'\xec\x9c\x84\xed\x97\x98 \xec\x99\x84\xed\x99\x94'), (b'transfer', b'\xec\x9c\x84\xed\x97\x98 \xec\x9d\xb4\xec\xa0\x84'), (b'avoidance', b'\xec\x9c\x84\xed\x97\x98 \xed\x9a\x8c\xed\x94\xbc')])),
                ('as_is', models.CharField(max_length=200, verbose_name='\ud604\uc7ac \uc0c1\ud669', blank=True)),
                ('to_be', models.CharField(max_length=200, verbose_name='\ud5a5\ud6c4 \uacc4\ud68d', blank=True)),
                ('desc', models.TextField(verbose_name='\uc0c1\uc138 \uc704\ud5d8 \uad00\ub9ac')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='update \ub0a0\uc9dc')),
                ('risk_action_code', models.ForeignKey(to='RiskManagement.Risk_analysis')),
            ],
            options={
                'ordering': ['risk_action_code'],
                'verbose_name': '\uc704\ud5d8 \ucc98\ub9ac \ubc29\uc548',
            },
        ),
        migrations.CreateModel(
            name='Staff',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name='\uc774\ub984')),
                ('position', models.CharField(max_length=30, verbose_name='\uc9c1\uc704')),
                ('location', models.CharField(max_length=100, verbose_name='\uc704\uce58')),
                ('depart', models.ForeignKey(verbose_name='\ubd80\uc11c', to='RiskManagement.Department')),
                ('duty', models.ForeignKey(verbose_name='\uc9c1\ubb34', to='RiskManagement.Duty')),
            ],
            options={
                'ordering': ['name'],
                'verbose_name': '\uc784\uc9c1\uc6d0',
            },
        ),
        migrations.CreateModel(
            name='Threat',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('threat_code', models.CharField(max_length=20)),
                ('category', models.CharField(default=b'Information', max_length=10, verbose_name='\uc790\uc0b0 \uc720\ud615', choices=[(b'Info', b'\xec\xa0\x95\xeb\xb3\xb4'), (b'Network', b'\xeb\x84\xa4\xed\x8a\xb8\xec\x9b\x8c\xed\x81\xac'), (b'Security', b'\xec\xa0\x95\xeb\xb3\xb4\xeb\xb3\xb4\xed\x98\xb8\xec\x8b\x9c\xec\x8a\xa4\xed\x85\x9c'), (b'OS', b'Operating System'), (b'SW', b'\xec\x86\x8c\xed\x94\x84\xed\x8a\xb8\xec\x9b\xa8\xec\x96\xb4'), (b'HW', b'\xeb\xac\xbc\xeb\xa6\xac\xec\xa0\x81 \xec\x9e\x90\xec\x82\xb0')])),
                ('actor', models.CharField(max_length=30, verbose_name='\ud589\uc704\uc790')),
                ('outcome', models.CharField(default=b'Disclosure', max_length=12, verbose_name='\uc704\ud611 \uacb0\uacfc', choices=[(b'Disclosure', b'\xeb\x85\xb8\xec\xb6\x9c(\xeb\xb9\x84\xeb\xb0\x80\xec\x84\xb1)'), (b'Modification', b'\xeb\xb3\x80\xea\xb2\xbd(\xeb\xac\xb4\xea\xb2\xb0\xec\x84\xb1)'), (b'Loss', b'\xeb\xb6\x84\xec\x8b\xa4/\xed\x8c\x8c\xea\xb4\xb4(\xea\xb0\x80\xec\x9a\xa9\xec\x84\xb1)'), (b'Interruption', b'\xec\xa4\x91\xeb\x8b\xa8(\xea\xb0\x80\xec\x9a\xa9\xec\x84\xb1)')])),
                ('scenario', models.TextField(verbose_name='\uc704\ud611 \uc2dc\ub098\ub9ac\uc624')),
                ('impact', models.IntegerField(default=b'High', verbose_name='\uc704\ud611 \uac15\ub3c4', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
                ('frequency', models.IntegerField(default=b'High', verbose_name='\ubc1c\uc0dd \ube48\ub3c4', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
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
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='\ubd84\uc11d \ub0a0\uc9dc')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='update \ub0a0\uc9dc')),
                ('asset', models.ForeignKey(verbose_name='\uc790\uc0b0', to='RiskManagement.Asset')),
            ],
            options={
                'ordering': ['vul_code'],
                'verbose_name': '\ucde8\uc57d\uc810 \ubd84\uc11d',
            },
        ),
        migrations.CreateModel(
            name='Vulnerability',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('vul_code', models.CharField(max_length=20)),
                ('classification', models.CharField(default=b'Management', max_length=10, verbose_name='\ucde8\uc57d\uc810 \ubd84\ub958', choices=[(b'Unix', b'Unix Server \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'Windows', b'Windows Server \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'Web', b'Web server \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'Network', b'Network \xec\x9e\xa5\xeb\xb9\x84 \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'Security', b'\xeb\xb3\xb4\xec\x95\x88 \xec\x9e\xa5\xeb\xb9\x84 \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'DB', b'DB \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'PC', b'PC \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'Management', b'\xea\xb4\x80\xeb\xa6\xac\xec\xa0\x81 \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90'), (b'Physical', b'\xeb\xac\xbc\xeb\xa6\xac\xec\xa0\x81 \xec\xb7\xa8\xec\x95\xbd\xec\xa0\x90')])),
                ('entry', models.CharField(max_length=50, verbose_name='\ucde8\uc57d\uc810 \ud56d\ubaa9')),
                ('desc', models.TextField(verbose_name='\ucde8\uc57d\uc810 \ub0b4\uc6a9')),
                ('rating', models.IntegerField(default=b'High', verbose_name='\ucde8\uc57d\uc810 \ub4f1\uae09', choices=[(1, b'Low'), (2, b'Medium'), (3, b'High')])),
                ('category', models.CharField(max_length=50, verbose_name='\ucde8\uc57d\uc810 \uc18c\ubd84\ub958')),
                ('control', models.TextField(verbose_name='\uc870\uce58\ubc29\uc548')),
            ],
            options={
                'ordering': ['vul_code'],
                'verbose_name': '\ucde8\uc57d\uc810',
            },
        ),
        migrations.AddField(
            model_name='vul_analysis',
            name='vul_code',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810', to='RiskManagement.Vulnerability'),
        ),
        migrations.AddField(
            model_name='risk_analysis',
            name='threat_code',
            field=models.ForeignKey(verbose_name='\uc5f0\uad00 \ucf54\ub4dc', to='RiskManagement.Threat'),
        ),
        migrations.AddField(
            model_name='risk_analysis',
            name='vul_code',
            field=models.ForeignKey(verbose_name='\ucde8\uc57d\uc810 \ubd84\uc11d \ucf54\ub4dc', to='RiskManagement.Vul_analysis'),
        ),
        migrations.AddField(
            model_name='asset',
            name='staff_name',
            field=models.ForeignKey(verbose_name='\uad00\ub9ac\uc790', to='RiskManagement.Staff'),
        ),
    ]
