#coding: utf-8
from django.contrib import admin
#from . import models
from django_markdown.admin import MarkdownModelAdmin
from django_markdown.widgets import AdminMarkdownWidget
from django.db.models import TextField

# Register your models here.

from .models import Company, Department, Duty, Staff, Asset, Vulnerability, Threat, Mapping, Vul_analysis, Risk_analysis, Risk_control


class CompanyAdmin(admin.ModelAdmin):
	list_display = [ "corp_name", "biz_reg_no", "address", "established", "biz_type", "representative", "sales" ]

class DepartmentAdmin(admin.ModelAdmin):
	list_display = [ "depart", "desc" ]
	list_filter = [ "depart" ]

class DutyAdmin(MarkdownModelAdmin):
	list_display = [ "duty", "outline" ]
	formfield_overrides = {TextField: {'widget': AdminMarkdownWidget}}

class StaffAdmin(admin.ModelAdmin):
	list_display = [ "name", "depart", "duty", "position", "location" ]
	list_filter = [ "name" ]

class Asset_valuationAdmin(admin.ModelAdmin):
	list_display = [ "code", "cia", "rating", "desc" ]

class AssetAdmin(admin.ModelAdmin):
	search_filter = [ "asset_name"  ]
	list_display = [ "asset_code", "asset_class", "asset_name", "use", "cnt", "model", "made", "os", "version", "ip", "mac", "location", "archive", "staff_name", "confidential", "integrity", "availability", "text" ]
	list_filter = [ "asset_class", "use", "made", "archive", "staff_name" ]

class VulnerabilityAdmin(admin.ModelAdmin):
	list_display = [ "vul_code", "classification", "subclass", "entry", "rating", "desc", "control" ]
	list_filter = [ "classification" ]

class ThreatAdmin(admin.ModelAdmin):
	list_display = [ "threat_code", "category", "outcome", "scenario", "impact", "frequency", "threat_score" ]
	list_filter = [ "threat_code" ]

class MappingAdmin(admin.ModelAdmin):
	list_display = [ "mapping_code", "asset"  ]

class Vul_analysisAdmin(admin.ModelAdmin):
	list_display = [ "vul", "created", "updated", "asset", "vul_score" ]
	list_filter = [ "vul" ]

class Risk_analysisAdmin(admin.ModelAdmin):
	list_display = [ "risk_code", "created", "updated", "asset", "vul", "threat", "risk_score" ]
	list_filter = [ "risk_code" ]

class Risk_controlAdmin(admin.ModelAdmin):
	list_display = [ "risk_action_code", "control_item", "risk_action", "as_is", "to_be", "desc", "created", "updated" ]
	list_filter = [ "risk_action_code" ]

#admin.site.register(Company, CompanyAdmin)
#admin.site.register(Department, DepartmentAdmin)
#admin.site.register(Duty, DutyAdmin)
#admin.site.register(Staff, StaffAdmin)
#admin.site.register(Asset, AssetAdmin)
#admin.site.register(Vulnerability, VulnerabilityAdmin)
#admin.site.register(Threat, ThreatAdmin)
#admin.site.register(Mapping, MappingAdmin)
#admin.site.register(Vul_analysis, Vul_analysisAdmin)
#admin.site.register(Risk_analysis, Risk_analysisAdmin)
#admin.site.register(Risk_control, Risk_controlAdmin)
