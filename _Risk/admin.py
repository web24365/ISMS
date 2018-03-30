#coding: utf-8
from django.contrib import admin
admin.autodiscover()

# Register your models here.

#from .models import Company, Department, Duty, Staff, Rating, Asset, Risk_mgmt, Vulnerability, Threat, Mapping, Vul_analysis, Risk_analysis, Risk_control
from .models import Company, Department, Staff, Rating, Asset, Risk_mgmt, Vulnerability, Threat, Mapping, Vul_analysis, Risk_analysis, Risk_control


class CompanyAdmin(admin.ModelAdmin):
	list_display = [ "corp_name", "biz_reg_no", "address", "established", "biz_type", "representative", "sales" ]

#class DutyAdmin(admin.ModelAdmin):
#	list_display = [ "duty", "outlines", "desc" ]

class StaffInline(admin.TabularInline):
	model = Staff
	extra = 5

#class OrgAdmin(admin.ModelAdmin):
#	list_display = [ "org_depart", "name", "position", "location" ]
#	list_filter = [ "name" ]

#class DepartmentAdmin(admin.ModelAdmin):
#	list_display = [ "company", "depart", "desc" ]
#	list_filter = [ "depart" ]

class DepartmentAdmin(admin.ModelAdmin):
	inlines = [ StaffInline ]
	list_display = [ "corpinfo", "depart", "desc" ]
	list_filter = [ "depart" ]

class RatingAdmin(admin.ModelAdmin):
	list_display = [ "rating_code", "rating_score" ]
	list_filter = [ "rating_code" ]

class AssetAdmin(admin.ModelAdmin):
	search_filter = [ "asset_name"  ]
	list_display = [ "asset_code", "asset_class", "asset_name", "use", "cnt", "model", "made", "os", "version", "ip", "mac", "location", "archive", "name", "confidential", "integrity", "availability", "rating", "text" ]
	list_filter = [ "asset_class", "use", "made", "archive", "name" ]

class Risk_mgmtAdmin(admin.ModelAdmin):
	list_display = [ "risk_mgmt_code", "action_code", "action_desc" ]
	list_filter = [ "risk_mgmt_code" ]

class VulnerabilityAdmin(admin.ModelAdmin):
	list_display = [ "vul_code", "vul_class", "vul_entry", "vul_desc", "vul_rating" ]
	list_filter = [ "vul_class" ]

	list_display = [ "org_depart", "name", "position", "location" ]
	list_filter = [ "name" ]
#class OrgAdmin(admin.ModelAdmin):
#	list_display = [ "org_depart", "name", "position", "location" ]
#	list_filter = [ "name" ]

class RatingAdmin(admin.ModelAdmin):
	list_display = [ "rating_code", "rating_score" ]
	list_filter = [ "rating_code" ]

class AssetAdmin(admin.ModelAdmin):
	search_filter = [ "asset_name"  ]
	list_display = [ "asset_code", "asset_class", "asset_name", "use", "cnt", "model", "made", "os", "version", "ip", "mac", "location", "archive", "name", "confidential", "integrity", "availability", "rating", "text" ]
	list_filter = [ "asset_class", "use", "made", "archive", "name" ]

class Risk_mgmtAdmin(admin.ModelAdmin):
	list_display = [ "risk_mgmt_code", "action_code", "action_desc" ]
	list_filter = [ "risk_mgmt_code" ]

class VulnerabilityAdmin(admin.ModelAdmin):
	list_display = [ "vul_code", "vul_class", "vul_entry", "vul_desc", "vul_rating" ]
	list_filter = [ "vul_class" ]

class ThreatAdmin(admin.ModelAdmin):
	list_display = [ "threat_code", "threat_class", "threat_type", "threat_entry", "threat_scenario", "threat_impact", "threat_frequency", "threat_score" ]
	list_filter = [ "threat_class" ]

class MappingAdmin(admin.ModelAdmin):
	list_display = [ "mapping_code", "vul_code", "threat_code" ]

class Vul_analysisAdmin(admin.ModelAdmin):
	list_display = [ "vul_analysis_code", "created", "updated", "asset_code", "vul_code", "vul_results" ]
	list_filter = [ "vul_analysis_code" ]

class Risk_analysisAdmin(admin.ModelAdmin):
	list_display = [ "risk_code", "created", "updated", "asset_code", "vul_analysis_code", "mapping_code", "risk_score" ]
	list_filter = [ "risk_code" ]

class Risk_controlAdmin(admin.ModelAdmin):
	list_display = [ "risk_code", "risk_mgmt_code", "additional_control" ]
	list_filter = [ "risk_code" ]

admin.site.register(Company, CompanyAdmin)
admin.site.register(Department, DepartmentAdmin)
#admin.site.register(Duty, DutyAdmin)
admin.site.register(Rating, RatingAdmin)
admin.site.register(Asset, AssetAdmin)
admin.site.register(Risk_mgmt, Risk_mgmtAdmin)
admin.site.register(Vulnerability, VulnerabilityAdmin)
admin.site.register(Threat, ThreatAdmin)
admin.site.register(Mapping, MappingAdmin)
admin.site.register(Vul_analysis, Vul_analysisAdmin)
admin.site.register(Risk_analysis)
admin.site.register(Risk_control, Risk_controlAdmin)
