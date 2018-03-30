#-*- coding: utf-8 -*-

from django.db import models
from django.core.urlresolvers import reverse
from django.utils.safestring import mark_safe
#from django_extensions.db.fields import AutoSlugField

# Create your models here.

Low = 1
Medium = 2
High = 3
RATING_CHOICES = (
                (Low, 'Low'),
                (Medium, 'Medium'),
                (High, 'High'),
)

APPLY_CHOICES = (
                (1, '취약'),
                (0.5, '일부 취약'),
                (0, '양호'),
)

OUTCOME_CHOICES = (
                ('Disclosure', '노출(비밀성)'),
                ('Modification', '변경(무결성)'),
                ('Loss', '분실/파괴(가용성)'),
                ('Interruption', '중단(가용성)'),
)

FACTOR_CHOICES = (
    ('C', 'Confidential'),
    ('I', 'Integrity'),
    ('A', 'Availability'),
)

VUL_CHOICES = (
    ('Unix', 'Unix Server 취약점'),
    ('Windows', 'Windows Server 취약점'),
    ('Web', 'Web server 취약점'),
    ('Network', 'Network 장비 취약점'),
    ('Security', '보안 장비 취약점'),
    ('DB', 'DB 취약점'),
    ('PC', 'PC 취약점'),
    ('Management', '관리적 취약점'),
    ('Physical', '물리적 취약점'),
)

ASSET_CHOICES = (
	('Info', '정보'),
	('Network', "네트워크"),
	('Security', "정보보호시스템"),
	('OS', "Operating System"),
	('SW', '소프트웨어'),
	('HW', "물리적 자산"),
)
#ASSET_CHOICES = (
#	('Info', '정보'),
#	('SW', '소프트웨어'),
#	('Server', "서버"),
#	('Network', "네트워크"),
#	('Security', "정보보호시스템"),
#	('DBMS', "DBMS"), 
#	('Web', "Web 서버"),
#	('PC', "PC"),
#	('URL', "URL"),
#	('Physical', "물리적 자산"),
#)

# 회사
class Company(models.Model):

	class Meta:
		verbose_name = u'회사'

        corp_name=models.CharField(verbose_name=u'회사 이름', max_length = 30)
        biz_reg_no=models.CharField(verbose_name=u'사업자등록번호', max_length = 30)
        address=models.CharField(verbose_name=u'사업장 소재지', max_length = 100)
        established=models.DateField(verbose_name=u'개업일')
        biz_type=models.CharField(verbose_name=u'업태', max_length = 30)
        representative=models.CharField(verbose_name=u'대표자', max_length = 30)
        sales=models.IntegerField(verbose_name=u'전년도 매출액')

# table name
        def __unicode__(self):
                return self.corp_name

	def get_absolute_url(self):
		#return  reverse('risk:company_detail', kwargs={ 'pk': self.slug })
		return  reverse('risk:company_detail', kwargs={ 'pk': str(self.id) })
		#return  "/RiskManagement/company/%i" %self.id


# 부서
class Department(models.Model):

	class Meta:
		verbose_name = u'부서'
		ordering = ['depart']

        corpinfo=models.ForeignKey(Company, verbose_name=u'회사')
        depart=models.CharField(verbose_name=u'부서', max_length = 30)
        desc=models.CharField(verbose_name=u'주요 업무', max_length = 50)
	
	def num_departs(self):
		return self.objects.all.count()

        def __unicode__(self):
                return self.depart

# 직무 기술
class Duty(models.Model):

	class Meta:
		verbose_name = u'직무 기술서'
		ordering = [ 'duty' ]

        duty=models.CharField(verbose_name=u'직무', max_length=20)
        outline=models.CharField(verbose_name=u'개요', max_length=100)
        desc=models.TextField(verbose_name=u'직무 기술')

	def display_desc_safefield(self):
		return mark_safe(self.desc)

        def __unicode__(self):
                return self.duty

	def get_absolute_url(self):
		return  reverse('risk:duty_detail', kwargs={ 'pk': str(self.id) })
		#return  reverse('risk:duty_list')

# 인원
class Staff(models.Model):

	class Meta:
		verbose_name = u'임직원'
		ordering = [ 'name' ]

        name=models.CharField(verbose_name=u'이름', max_length = 30)
        depart=models.ForeignKey(Department, verbose_name=u'부서')
        duty=models.ForeignKey(Duty, verbose_name=u'직무')
        position=models.CharField(verbose_name=u'직위', max_length = 30)
        location=models.CharField(verbose_name=u'위치', max_length = 100)

        def __unicode__(self):
                return self.name

# 협력 회사
class Partner(models.Model):
	verbose_name = u"협력회사"
	ordering = [ 'name' ]
		
	name=models.CharField(verbose_name=u"회사명", max_length=30)
	outline=models.CharField(verbose_name=u"주요 업무", max_length=30)
	desc=models.CharField(verbose_name=u"상세 내역", max_length=200)
		
	def __unicode__(self):
               	return self.name

# 자산 평가 기준
class Asset_valuation(models.Model):

	class Meta:
		verbose_name = u"자산 평가기준"
		ordering = [ 'cia']

	valuation_code = models.CharField(max_length=10)
	cia = models.CharField(max_length=1, choices=FACTOR_CHOICES, verbose_name=u"평가 기준")
	rating = models.IntegerField(choices=RATING_CHOICES, verbose_name=u"구분")
	desc = models.CharField(max_length=200, verbose_name=u"상세 내용")

	def __unicode__(self):
               	return self.cia

# 자산 분석
class Asset(models.Model):

	class Meta:
        	verbose_name = u'자산'
                ordering = [ 'asset_class', 'asset_name']

	asset_code=models.CharField(verbose_name=u'자산 코드', max_length = 20, unique=True)
	asset_class=models.CharField(choices=ASSET_CHOICES, verbose_name=u'자산 분류', max_length = 8)
	asset_name=models.CharField(verbose_name=u'이름', max_length = 50, blank=True)
	staff_name=models.ForeignKey(Staff, verbose_name=u'관리자')
	use=models.CharField(verbose_name=u'용도', max_length = 50, blank=True)
	cnt=models.IntegerField(verbose_name=u'수량', default=1, blank=True)
	model=models.CharField(verbose_name=u'기종(model 명)', max_length = 50, blank=True)
	made=models.CharField(verbose_name=u'제조업체', max_length = 50, blank=True)
	url=models.URLField(verbose_name=u'URL', max_length = 100, blank=True)
	os=models.CharField(verbose_name=u'OS', max_length = 50, blank=True)
	version=models.CharField(verbose_name=u'Version', max_length = 50, blank=True)
	ip=models.GenericIPAddressField(verbose_name=u'IP address', blank=True, null=True)
	mac=models.CharField(verbose_name=u'MAC address', max_length = 50, blank=True)
	location=models.CharField(verbose_name=u'위치', max_length = 100, blank=True)
	archive=models.CharField(verbose_name=u'보관형태', max_length = 50, blank=True)
	confidential=models.IntegerField(choices=RATING_CHOICES, verbose_name=u'Confidential', blank=True)
	integrity=models.IntegerField(choices=RATING_CHOICES, verbose_name=u'Integrity', blank=True)
	availability=models.IntegerField(choices=RATING_CHOICES, verbose_name=u'Availability', blank=True)
	text=models.TextField(verbose_name=u'비고', blank=True)
	asset_score=models.IntegerField(verbose_name=u'자산 점수', null=True)

        def save(self, *args, **kwargas):
                self.asset_score = self.confidential * self.integrity * self.availability
                super(Asset, self).save(*args, **kwargas)

	#def _get_score(self):
	#	return self.confidential * self.integrity * self.availability

	#asset_score = property(_get_score)

#	def _get_confidential(self):
#		Asset_valuation.objects.get(cia="C")
#		return self.Asset_valuation
#	c = property(_get_confidential, choices="RATING CHOICES")
#
#	def _get_Integrity(self):
#		Asset_valuation.objects.get(cia="I")
#		return self.Asset_valuation
#	i = property(_get_Integrity)
#	
#	def _get_availability(self):
#		Asset_valuation.objects.get(cia="A")
#		return self.Asset_valuation
#	a = property(_get_availability)

	def __unicode__(self):
		return self.asset_name
	
# 취약점 항목 정리
class Vulnerability(models.Model):

	class Meta:
                verbose_name = u'취약점'
                ordering = [ 'vul_code' ]

	vul_code=models.CharField(max_length = 20)
	classification=models.CharField(choices=VUL_CHOICES, default="Management", verbose_name=u'취약점 분류', max_length = 10)
	subclass=models.CharField(verbose_name=u'취약점 소분류', max_length = 50)
	entry=models.CharField(verbose_name=u'취약점 요약', max_length = 50)
	rating=models.IntegerField(choices=RATING_CHOICES, default='High', verbose_name=u'취약점 등급')
	desc=models.TextField(verbose_name=u'취약점 내용')
	control=models.TextField(verbose_name=u'조치방안')

	def display_desc_safefield(self):
		return mark_safe(self.desc)

	def display_control_safefield(self):
		return mark_safe(self.control)

	def __unicode__(self):
		return self.vul_code

# 위협 분석
class Threat(models.Model):

	class Meta:
                verbose_name = u'위협'
                ordering = [ 'threat_code' ]

	threat_code=models.CharField(max_length = 20)
	category=models.CharField(max_length=10, choices=ASSET_CHOICES, default='Information', verbose_name=u'자산 유형')
	actor=models.CharField(verbose_name=u'행위자', max_length=30)
	outcome=models.CharField(max_length=12, choices=OUTCOME_CHOICES, default='Disclosure', verbose_name=u'위협 결과')
	scenario=models.TextField(verbose_name=u'위협 시나리오')
	impact=models.IntegerField(choices=RATING_CHOICES, default='High', verbose_name=u'위협 강도')
	frequency=models.IntegerField(choices=RATING_CHOICES, default='High', verbose_name=u'발생 빈도')
	threat_score=models.IntegerField(verbose_name=u'위협 점수', null=True)

	def display_scenario_safefield(self):
		return mark_safe(self.desc)

        def save(self, *args, **kwargs):
                self.threat_score = self.impact * self.frequency
                super(Threat, self).save(*args, **kwargs)

	def __unicode__(self):
		return u"%s->%s->%s" % (self.category, self.actor, self.outcome)

# 취약점 분석
class Vul_analysis(models.Model):

        class Meta:
                verbose_name = u'취약점 분석'
                ordering = [ 'asset' ]

        vul=models.ForeignKey(Vulnerability, verbose_name=u'취약점')
        asset=models.ForeignKey(Asset, verbose_name=u'자산')
        isapplied=models.FloatField(choices=APPLY_CHOICES, verbose_name=u'적용 여부', null=True)
        created= models.DateTimeField(auto_now_add=True, verbose_name=u'분석 날짜')
        updated= models.DateTimeField(auto_now=True, verbose_name=u'update 날짜')
        vul_score=models.FloatField(verbose_name=u'취약점 분석 결과', null=True)

        def save(self, *args, **kwargs):
                self.vul_score = self.isapplied * self.asset.asset_score * self.vul.rating
                super(Vul_analysis, self).save(*args, **kwargs)

        def __unicode__(self):
                return u"%s - %s" % (self.asset, self.vul.desc)

#class MappingManager(models.Manager):

#	def by_asset(self, asset, **kwargs):
#		return self.select_related().filter(asset=asset)

	# 선택한 자산에 해당하는 취약점
	#asset field로 filtering
#	def by_vul_analysis(self, asset, **kwargs):
		#data = self.select_related().filter(asset=asset)
		#data = self.by_asset(asset)
#		return data.values('vul_analysis__asset').annotate(count=models.Count('vul')).order_by('asset')
		#return super(MappingManager, self).get_query_set().filter(asset=vul_analysis.asset.id)

	# 선택한 자산에 해당하는 위협
#	def by_threat(self, asset, **kwargs):
#		data = self.select_related().filter(asset=asset)
#		return data.values('threat__category').annotate(count=models.Count('category')).order_by('threat')
		#return super(MappingManager, self).get_query_set().filter(asset=asset.asset.asset_class)


# 자산과 위협 상관 관계 분석
class Mapping(models.Model):

	class Meta:
                verbose_name = u'자산과 위협 상관 관계 분석'
                ordering = [ 'mapping_code' ]

#	objects = MappingManager()

	mapping_code = models.CharField(max_length = 20)
	asset = models.ForeignKey(Asset, verbose_name=u'자산')
	vul = models.ForeignKey(Vul_analysis, verbose_name=u'취약점', null=True)
	threat = models.ForeignKey(Threat, verbose_name=u'위협', null=True)

	#def by_vul_analysis(self, asset, **kwargs):
	#	data = self.select_related().filter(asset=asset)
	#	return data.objects.vaules('vul_analysis__asset').annotate(count=models.Count('vul')).order_by('asset')
		#return super(MappingManager, self).get_query_set().filter(asset=vul_analysis.asset.id)

	#def by_threat(self, asset, **kwargs):
	#	data = self.select_related().filter(asset=asset)
	#	return data.objects.vaules('threat__category').annotate(count=models.Count('category')).order_by('threat')
		#return super(MappingManager, self).get_query_set().filter(asset=asset.asset.asset_class)

	#def _get_threat(self):
        #        return self.Asset.asset
        #threat_code = property(_get_threat)

	def __unicode__(self):
		return self.mapping_code

# 위험 분석
class Risk_analysis(models.Model):

	class Meta:
                verbose_name = u'위험 분석'
                ordering = [ 'vul' ]

	vul = models.ForeignKey(Vul_analysis, verbose_name=u'취약점 분석')
	threat = models.ForeignKey(Threat, verbose_name=u'관련 위협')
        risk_score = models.FloatField(verbose_name=u'위험 분석 결과')
	created = models.DateTimeField(auto_now_add=True, verbose_name=u'분석 날짜')
	#updated = models.DateTimeField(auto_now=True, verbose_name=u'update 날짜')

	#def _get_vScore(self):
	#	return self.vul_analysis.vul_results
	#vul_score = property(_get_vScore)

	#def _get_tScore(self):
	#	return self.threat.threat_score
	#threat_score = property(_get_tScore)

	#def _get_rScore(self):
        #        return self.vul_code.vul_score * self.threat_code.threat_score
	#risk_score = property(_get_rScore)
	
        def save(self, *args, **kwargs):
                self.risk_score = self.vul.vul_score * self.threat.threat_score
                super(Risk_analysis, self).save(*args, **kwargs)

	def __unicode__(self):
                return u"%s - %s" % (self.vul.asset, self.risk_score)

# 위험 관리
class Risk_control(models.Model):

	class Meta:
                verbose_name = u'위험 처리 방안'
                ordering = [ 'risk_action_code' ]

	ACTION_CHOICES = (
                ('acceptance', '위험 수용'),
                ('reduction', '위험 완화'),
                ('transfer', '위험 이전'),
                ('avoidance', '위험 회피'),
        )

	risk_action_code = models.ForeignKey(Risk_analysis)
	control_item = models.CharField(max_length=50, verbose_name=u'통제 항목', blank=True)
	risk_action = models.CharField(max_length=20, choices=ACTION_CHOICES, default='acceptance', verbose_name=u'위험 대응 방안')
	as_is = models.CharField(max_length=200, verbose_name=u'현재 상황', blank=True)
	to_be = models.CharField(max_length=200, verbose_name=u'향후 계획', blank=True)
	desc = models.TextField(verbose_name=u'상세 위험 관리')
	created = models.DateTimeField(auto_now_add=True, verbose_name=u'분석 날짜')
	#updated = models.DateTimeField(auto_now=True, verbose_name=u'update 날짜')

	def __unicode__(self):
		return self.risk_action_code
