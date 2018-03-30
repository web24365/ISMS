"""ISMS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import patterns, include, url
from django.contrib.auth.decorators import login_required as auth

from . import views
#from .views import CompanyCreate

urlpatterns = patterns(
    '',
    url(r'^$', views.RiskModel.as_view(), name='index'),
    url(r'^stats_json/$', views.stats_json, name='stats_json'),
    # Company
    url(r'^company/$', views.CompanyList.as_view(), name='company_list'),
    url(r'^company/(?P<pk>\d+)$', views.CompanyDetail.as_view(), name='company_detail'),
    url(r'^company/update/(?P<pk>\d+)/$', auth(views.CompanyUpdate.as_view()), name='company_update'),
    url(r'^company/delete/(?P<pk>\d+)/$', auth(views.CompanyDelete.as_view()), name='company_delete'),
    url(r'^company/create/$', auth(views.CompanyCreate.as_view()), name='company_create'),
    url(r'^company/listjson/$', auth(views.CompanyListJson.as_view()), name='company_list_json'),
    # Department
    url(r'^department/$', views.DepartmentList.as_view(), name='department_list'),
    url(r'^department/(?P<pk>\d+)/$', views.DepartmentDetail.as_view(), name='department_detail'),
    url(r'^department/update/(?P<pk>\d+)/$', auth(views.DepartmentUpdate.as_view()), name='department_update'),
    url(r'^department/delete/(?P<pk>\d+)/$', auth(views.DepartmentDelete.as_view()), name='department_delete'),
    url(r'^department/create/$', auth(views.DepartmentCreate.as_view()), name='department_create'),
    url(r'^department/listjson/$', auth(views.DepartmentListJson.as_view()), name='department_list_json'),
    # Duty
    url(r'^duty/$', views.DutyList.as_view(), name='duty_list'),
    url(r'^duty/(?P<pk>\d+)/$', views.DutyDetail.as_view(), name='duty_detail'),
    url(r'^duty/update/(?P<pk>\d+)/$', auth(views.DutyUpdate.as_view()), name='duty_update'),
    url(r'^duty/delete/(?P<pk>\d+)/$', auth(views.DutyDelete.as_view()), name='duty_delete'),
    url(r'^duty/create/$', auth(views.DutyCreate.as_view()), name='duty_create'),
    url(r'^duty/listjson/$', auth(views.DutyListJson.as_view()), name='duty_list_json'),
    # Staff
    url(r'^staff/$', views.StaffList.as_view(), name='staff_list'),
    url(r'^staff/(?P<pk>\d+)/$', views.StaffDetail.as_view(), name='staff_detail'),
    url(r'^staff/update/(?P<pk>\d+)/$', auth(views.StaffUpdate.as_view()), name='staff_update'),
    url(r'^staff/delete/(?P<pk>\d+)/$', auth(views.StaffDelete.as_view()), name='staff_delete'),
    url(r'^staff/create/$', auth(views.StaffCreate.as_view()), name='staff_create'),
    url(r'^staff/listjson/$', auth(views.StaffListJson.as_view()), name='staff_list_json'),
    # Partner
    url(r'^partner/$', views.PartnerList.as_view(), name='partner_list'),
    url(r'^partner/(?P<pk>\d+)/$', views.PartnerDetail.as_view(), name='partner_detail'),
    url(r'^partner/update/(?P<pk>\d+)/$', auth(views.PartnerUpdate.as_view()), name='partner_update'),
    url(r'^partner/delete/(?P<pk>\d+)/$', auth(views.PartnerDelete.as_view()), name='partner_delete'),
    url(r'^partner/create/$', auth(views.PartnerCreate.as_view()), name='partner_create'),
    url(r'^partner/listjson/$', auth(views.PartnerListJson.as_view()), name='partner_list_json'),
    # Asset_valuation
    url(r'^asset_valuation/$', views.Asset_valuationList.as_view(), name='asset_valuation_list'),
    url(r'^asset_valuation/(?P<pk>\d+)/$', views.Asset_valuationDetail.as_view(), name='asset_valuation_detail'),
    url(r'^asset_valuation/update/(?P<pk>\d+)/$', auth(views.Asset_valuationUpdate.as_view()), name='asset_valuation_update'),
    url(r'^asset_valuation/delete/(?P<pk>\d+)/$', auth(views.Asset_valuationDelete.as_view()), name='asset_valuation_delete'),
    url(r'^asset_valuation/create/$', auth(views.Asset_valuationCreate.as_view()), name='asset_valuation_create'),
    url(r'^asset_valuation/listjson/$', auth(views.Asset_valuationListJson.as_view()), name='asset_valuation_list_json'),
    # Asset
    url(r'^asset/$', views.AssetList.as_view(), name='asset_list'),
    url(r'^asset/(?P<pk>\d+)/$', views.AssetDetail.as_view(), name='asset_detail'),
    url(r'^asset/update/(?P<pk>\d+)/$', auth(views.AssetUpdate.as_view()), name='asset_update'),
    url(r'^asset/delete/(?P<pk>\d+)/$', auth(views.AssetDelete.as_view()), name='asset_delete'),
    url(r'^asset/create/$', auth(views.AssetCreate.as_view()), name='asset_create'),
    url(r'^asset/listjson/$', auth(views.AssetListJson.as_view()), name='asset_list_json'),
    # Vulnerability
    url(r'^vul/$', views.VulnerabilityList.as_view(), name='vulnerability_list'),
    url(r'^vul/(?P<pk>\d+)/$', views.VulnerabilityDetail.as_view(), name='vulnerability_detail'),
    url(r'^vul/update/(?P<pk>\d+)/$', auth(views.VulnerabilityUpdate.as_view()), name='vulnerability_update'),
    url(r'^vul/delete/(?P<pk>\d+)/$', auth(views.VulnerabilityDelete.as_view()), name='vulnerability_delete'),
    url(r'^vul/create/$', auth(views.VulnerabilityCreate.as_view()), name='vulnerability_create'),
    url(r'^vul/listjson/$', auth(views.VulnerabilityListJson.as_view()), name='vulnerability_list_json'),
    # Threat
    url(r'^threat/$', views.ThreatList.as_view(), name='threat_list'),
    url(r'^threat/(?P<pk>\d+)/$', views.ThreatDetail.as_view(), name='threat_detail'),
    url(r'^threat/update/(?P<pk>\d+)/$', auth(views.ThreatUpdate.as_view()), name='threat_update'),
    url(r'^threat/delete/(?P<pk>\d+)/$', auth(views.ThreatDelete.as_view()), name='threat_delete'),
    url(r'^threat/create/$', auth(views.ThreatCreate.as_view()), name='threat_create'),
    url(r'^threat/listjson/$', auth(views.ThreatListJson.as_view()), name='threat_list_json'),
    # Mapping
    url(r'^mapping/$', views.MappingList.as_view(), name='mapping_list'),
    url(r'^mapping/(?P<pk>\d+)/$', views.MappingDetail.as_view(), name='mapping_detail'),
    url(r'^mapping/update/(?P<pk>\d+)/$', auth(views.MappingUpdate.as_view()), name='mapping_update'),
    url(r'^mapping/delete/(?P<pk>\d+)/$', auth(views.MappingDelete.as_view()), name='mapping_delete'),
    url(r'^mapping/create/$', auth(views.MappingCreate.as_view()), name='mapping_create'),
    url(r'^mapping/listjson/$', auth(views.MappingListJson.as_view()), name='mapping_list_json'),
    # Vul_analysis
    url(r'^vul_analysis/$', views.Vul_analysisList.as_view(), name='vul_analysis_list'),
    url(r'^vul_analysis/(?P<pk>\d+)/$', views.Vul_analysisDetail.as_view(), name='vul_analysis_detail'),
    url(r'^vul_analysis/update/(?P<pk>\d+)/$', auth(views.Vul_analysisUpdate.as_view()), name='vul_analysis_update'),
    url(r'^vul_analysis/delete/(?P<pk>\d+)/$', auth(views.Vul_analysisDelete.as_view()), name='vul_analysis_delete'),
    url(r'^vul_analysis/create/$', auth(views.Vul_analysisCreate.as_view()), name='vul_analysis_create'),
    url(r'^vul_analysis/listjson/$', auth(views.Vul_analysisListJson.as_view()), name='vul_analysis_list_json'),
    # Risk_analysis
    url(r'^risk_analysis/$', views.Risk_analysisList.as_view(), name='risk_analysis_list'),
    url(r'^risk_analysis/(?P<pk>\d+)/$', views.Risk_analysisDetail.as_view(), name='risk_analysis_detail'),
    url(r'^risk_analysis/update/(?P<pk>\d+)/$', auth(views.Risk_analysisUpdate.as_view()), name='risk_analysis_update'),
    url(r'^risk_analysis/delete/(?P<pk>\d+)/$', auth(views.Risk_analysisDelete.as_view()), name='risk_analysis_delete'),
    url(r'^risk_analysis/create/$', auth(views.Risk_analysisCreate.as_view()), name='risk_analysis_create'),
    url(r'^risk_analysis/listjson/$', auth(views.Risk_analysisListJson.as_view()), name='risk_analysis_list_json'),
    # Risk_control
    url(r'^risk_control/$', views.Risk_controlList.as_view(), name='risk_control_list'),
    url(r'^risk_control/(?P<pk>\d+)/$', views.Risk_controlDetail.as_view(), name='risk_control_detail'),
    url(r'^risk_control/update/(?P<pk>\d+)/$', auth(views.Risk_controlUpdate.as_view()), name='risk_control_update'),
    url(r'^risk_control/delete/(?P<pk>\d+)/$', auth(views.Risk_controlDelete.as_view()), name='risk_control_delete'),
    url(r'^risk_control/create/$', auth(views.Risk_controlCreate.as_view()), name='risk_control_create'),
    url(r'^risk_control/listjson/$', auth(views.Risk_controlListJson.as_view()), name='risk_control_list_json'),
)
