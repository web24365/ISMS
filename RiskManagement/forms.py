#-*- coding: utf-8 -*-
from django import forms
from django.core.urlresolvers import reverse, reverse_lazy
#from django_markdown.fields import MarkdownFormField
#from django_markdown.widgets import MarkdownWidget

from crispy_forms.helper import FormHelper, Layout
from crispy_forms.layout import Button, Submit, MultiField, Div, HTML, Field, Fieldset, Reset
from crispy_forms.bootstrap import FormActions, TabHolder, Tab

from .models import Company, Partner, Asset_valuation, Asset, Department, Duty, Staff, Vulnerability, Threat, Mapping, Vul_analysis, Risk_analysis, Risk_control

# Company Form
class CompanyForm(forms.ModelForm):
	class Meta:
		model = Company
		fields = ("corp_name", "biz_reg_no", "address", "established", "biz_type", "representative", "sales")
	
class CompanyInputForm(forms.ModelForm):
	# This is a hidden field that holds the submit type value. Used to	
	# determine whether the user clicked 'Save' or 'Save & Add Another' in
    	# the Company Create Form.
	submit_button_type = forms.CharField(required = False)

	def __init__(self, *args, **kwargs):
		super(CompanyInputForm, self).__init__(*args, **kwargs)

		# If you pass FormHelper constructor a form instance
        	# It builds a default layout with all its fields
		self.helper = FormHelper()
		self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
		self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
		self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
		self.helper.add_input(Submit('submit', '저장'))
		self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:company_list')))

		# Remove the blank option from the select widget
		#self.fields['corp_name'].empty_label = None
		#self.fields['corp_name'].required = False

		self.helper.layout = Layout(
           	    HTML(
                       '''
               		{% if messages %}
               		{% for message in messages %}
               		<p {% if message.tags %}
               		class="alert alert-{{ message.tags }}"
               		{% endif %}>{{ message }}</p>{% endfor %}{% endif %}
               		'''
           	    ),
		Fieldset(
	    	    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
	    	    Field('corp_name', autofocus=True),
	    	    'biz_reg_no',
	    	    'address',
	    	    'established',
	    	    'biz_type',
	    	    'representative',
	    	    'sales',
	    	    #Field('submit_button_type', type='hidden'),
	    	    widgets={'submit_button_type': forms.HiddenInput()},
		)
	)

	class Meta:
		model = Company
		fields = (
                "corp_name", "biz_reg_no", "address", "established", "biz_type", "representative", "sales", 
                )
		widgets = { 'address': forms.Textarea(attrs={'rows': 3}), }

class CompanyCreateForm(CompanyInputForm):

	def __init__(self, *args, **kwargs):
		super(CompanyCreateForm, self).__init__(*args, **kwargs)

		self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class CompanyUpdateForm(CompanyInputForm):

	def __init__(self, *args, **kwargs):
		super(CompanyUpdateForm, self).__init__(*args, **kwargs)

		delete_url = reverse('risk:company_delete', args=(self.instance.id,))

		self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# partner Form
class PartnerForm(forms.ModelForm):
	class Meta:
		model = Partner
		fields = ("name", "outline", "desc")

class PartnerInputForm(forms.ModelForm):
	# This is a hidden field that holds the submit type value. Used to
	# determine whether the user clicked 'Save' or 'Save & Add Another' in
    	# the Partner Create Form.
	submit_button_type = forms.CharField(required = False)

	def __init__(self, *args, **kwargs):
		super(PartnerInputForm, self).__init__(*args, **kwargs)

		# If you pass FormHelper constructor a form instance
        	# It builds a default layout with all its fields
		self.helper = FormHelper()
		self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
		#self.helper.form_class = 'form-horizontal col-xs-12 col-md-6 col-lg-5'
		#self.helper.label_class = 'col-xs-3 col-md-2 col-lg-2'
		#self.helper.field_class = 'col-xs-9 col-md-10 col-lg-10'
		self.helper.add_input(Submit('submit', '저장'))
		self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:partner_list')))

		# Remove the blank option from the select widget
		#self.fields['corp_name'].empty_label = None
		#self.fields['corp_name'].required = False

		self.helper.layout = Layout(
           	    HTML(
                       '''
               		{% if messages %}
               		{% for message in messages %}
               		<p {% if message.tags %}
               		class="alert alert-{{ message.tags }}"
               		{% endif %}>{{ message }}</p>{% endfor %}{% endif %}
               		'''
           	    ),
		Fieldset(
	    	    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('name', autofocus=True),
	    	    'outline',
	    	    'desc',
	    	    widgets={'submit_button_type': forms.HiddenInput()},
		)
	)

	class Meta:
		model = Partner
		fields = ("name", "outline", "desc")

class PartnerCreateForm(PartnerInputForm):

        def __init__(self, *args, **kwargs):
                super(PartnerCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class PartnerUpdateForm(PartnerInputForm):

        def __init__(self, *args, **kwargs):
                super(PartnerUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:partner_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Asset_valuation Form
class Asset_valuationForm(forms.ModelForm):
	class Meta:
		model = Asset_valuation
		fields = ("valuation_code", "cia", "rating", "desc")

class Asset_valuationInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(Asset_valuationInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:asset_valuation_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('valuation_code', autofocus=True),
                    'cia',
                    'rating',
                    'desc',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )
	class Meta:
		model = Asset_valuation
                fields = ("valuation_code", "cia", "rating", "desc")

class Asset_valuationCreateForm(Asset_valuationInputForm):

        def __init__(self, *args, **kwargs):
                super(Asset_valuationCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class Asset_valuationUpdateForm(Asset_valuationInputForm):

        def __init__(self, *args, **kwargs):
                super(Asset_valuationUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:asset_valuation_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Asset Form
class AssetForm(forms.ModelForm):
	class Meta:
		model = Asset
		fields = ("asset_code", "asset_class", "asset_name", "use", "cnt", "model", "made", "os", "version", "ip", "mac", "location", "archive", "staff_name", "confidential", "integrity", "availability", "text" )

class AssetInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(AssetInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:asset_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('asset_code', autofocus=True),
		    'asset_code', 
		    "asset_class", 
                    "asset_name", 
		    "use", 
		    "cnt", 
		    "model", 
		    "made", 
		    "os", 
		    "version", 
		    "ip", 
		    "mac", 
		    "location", 
		    "archive", 
		    "staff_name", 
		    "confidential", 
		    "integrity", 
		    "availability", 
		    "text",
                    widgets={'submit_button_type': forms.HiddenInput()},
                ),
        )
        class Meta:
                model = Asset
		fields = ("asset_code", "asset_class", "asset_name", "use", "cnt", "model", "made", "os", "version", "ip", "mac", "location", "archive", "staff_name", "confidential", "integrity", "availability", "text")


class AssetCreateForm(AssetInputForm):

        def __init__(self, *args, **kwargs):
                super(AssetCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class AssetUpdateForm(AssetInputForm):

        def __init__(self, *args, **kwargs):
                super(AssetUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:asset_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Department Form
class DepartmentForm(forms.ModelForm):
	class Meta:
		model = Department
		fields = ("corpinfo", "depart", "desc")


class DepartmentInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(DepartmentInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:department_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('corpinfo', autofocus=True),
                    'depart',
                    'desc',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Department
		fields = ("corpinfo", "depart", "desc")


class DepartmentCreateForm(DepartmentInputForm):

        def __init__(self, *args, **kwargs):
                super(DepartmentCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class DepartmentUpdateForm(DepartmentInputForm):

        def __init__(self, *args, **kwargs):
                super(DepartmentUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:department_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Duty Form
class DutyForm(forms.ModelForm):
	class Meta:
		model = Duty
		fields = ("duty", "outline", "desc")

class DutyInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)
	#desc = forms.CharField(widget=MarkdownWidget())
	#desc = MarkdownFormField()

        def __init__(self, *args, **kwargs):
                super(DutyInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:duty_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('duty', autofocus=True),
                    'outline',
                    'desc',
                    widgets={'submit_button_type': forms.HiddenInput()},
		)
        )

        class Meta:
                model = Duty
		fields = ("duty", "outline", "desc")
		#widgets = { 'desc': forms.Textarea(attrs={'rows': 20}), }


class DutyCreateForm(DutyInputForm):

        def __init__(self, *args, **kwargs):
                super(DutyCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class DutyUpdateForm(DutyInputForm):

        def __init__(self, *args, **kwargs):
                super(DutyUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:duty_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

#Satff Form
class StaffForm(forms.ModelForm):
	class Meta:
		model = Staff
		fields = ("name", "depart", "duty", "position", "location")

class StaffInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(StaffInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button( 'cancel', '취소', onclick='document.location.href="%s";return false;' % reverse('risk:staff_list') ))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                    Fieldset(
                    	Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    	Field('name', autofocus=True),
                    	'depart',
                    	'duty',
                    	Field('position', placeholder='e.g. 직위, "사원", "대리", "과장", "이사"'),  
                    	Field('location', placeholder='e.g. 근무 위치, "본사", "물류창고"'),
                    	widgets={'submit_button_type': forms.HiddenInput()},
		    )
        )

        class Meta:
                model = Staff
                fields = ("name", "depart", "duty", "position", "location")


class StaffCreateForm(StaffInputForm):

        def __init__(self, *args, **kwargs):
                super(StaffCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class StaffUpdateForm(StaffInputForm):

        def __init__(self, *args, **kwargs):
                super(StaffUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:staff_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Vulnerability Form
class VulnerabilityForm(forms.ModelForm):
	class Meta:
		model = Vulnerability
		fields = ("vul_code", "classification", "subclass", "entry", "rating", "desc", "control")

class VulnerabilityInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(VulnerabilityInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:vulnerability_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('vul_code', autofocus=True),
                    'classification',
                    'subclass',
                    'entry',
                    'rating',
                    'desc',
                    'control',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Vulnerability
		fields = ("vul_code", "classification", "subclass", "entry", "rating", "desc", "control")

class VulnerabilityCreateForm(VulnerabilityInputForm):

        def __init__(self, *args, **kwargs):
                super(VulnerabilityCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class VulnerabilityUpdateForm(VulnerabilityInputForm):

        def __init__(self, *args, **kwargs):
                super(VulnerabilityUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:vulnerability_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Threat Form
class ThreatForm(forms.ModelForm):
	class Meta:
		model = Threat
		fields = ("threat_code", "category", "actor", "outcome", "scenario", "impact", "frequency")

class ThreatInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(ThreatInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:threat_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('threat_code', autofocus=True),
                    'category',
                    'actor',
                    'outcome',
                    'scenario',
                    'impact',
                    'frequency',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Threat
		fields = ("threat_code", "category", "actor", "outcome", "scenario", "impact", "frequency")


class ThreatCreateForm(ThreatInputForm):

        def __init__(self, *args, **kwargs):
                super(ThreatCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class ThreatUpdateForm(ThreatInputForm):

        def __init__(self, *args, **kwargs):
                super(ThreatUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:threat_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Mapping Form
class MappingForm(forms.ModelForm):
	class Meta:
		model = Mapping
		fields = ("mapping_code", "asset")

class MappingInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(MappingInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:mapping_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('mapping_code', autofocus=True),
                    'asset',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Mapping
                fields = ("mapping_code", "asset")

class MappingCreateForm(MappingInputForm):

        def __init__(self, *args, **kwargs):
                super(MappingCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class MappingUpdateForm(MappingInputForm):

        def __init__(self, *args, **kwargs):
                super(MappingUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:mapping_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Vul_analysis Form
#class Vul_analysisForm(forms.ModelForm):
#	class Meta:
#		model = Vul_analysis
#                fields = ("vul", "vul.entry", "asset", "isapplied")

class Vul_analysisInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(Vul_analysisInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:vul_analysis_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
                    Field('asset', row="10", autofocus=True),
		    'vul', 
		    'isapplied',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Vul_analysis
                fields = ("vul", "asset", "isapplied")


class Vul_analysisCreateForm(Vul_analysisInputForm):

        def __init__(self, *args, **kwargs):
                super(Vul_analysisCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class Vul_analysisUpdateForm(Vul_analysisInputForm):

        def __init__(self, *args, **kwargs):
                super(Vul_analysisUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:vul_analysis_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Risk_analysis Form
#class Risk_analysisForm(forms.ModelForm):
#	class Meta:
#		model = Risk_analysis
#		fields = ("risk_code", "asset", "vul", "threat")

class Risk_analysisInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(Risk_analysisInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		#self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
		self.helper.form_class = 'form-horizontal col-xs-12'
                self.helper.label_class = 'col-xs-4 col-md-2 col-lg-2'
                self.helper.field_class = 'col-xs-9 col-md-10 col-lg-10'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:risk_analysis_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('vul', autofocus=True),
                    'threat',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Risk_analysis
                fields = ("vul", "threat")



class Risk_analysisCreateForm(Risk_analysisInputForm):

        def __init__(self, *args, **kwargs):
                super(Risk_analysisCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class Risk_analysisUpdateForm(Risk_analysisInputForm):

        def __init__(self, *args, **kwargs):
                super(Risk_analysisUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:risk_analysis_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

# Risk_control Form
class Risk_controlForm(forms.ModelForm):
	class Meta:
		model = Risk_control
		fields = ("risk_action_code", "control_item", "risk_action", "as_is", "to_be", "desc")
class Risk_controlInputForm(forms.ModelForm):
        # This is a hidden field that holds the submit type value. Used to
        # determine whether the user clicked 'Save' or 'Save & Add Another' in
        # the Partner Create Form.
        submit_button_type = forms.CharField(required = False)

        def __init__(self, *args, **kwargs):
                super(Risk_controlInputForm, self).__init__(*args, **kwargs)

                # If you pass FormHelper constructor a form instance
                # It builds a default layout with all its fields
                self.helper = FormHelper()
                self.helper.form_method = 'post'
		self.helper.form_class = 'form-horizontal col-xs-12 col-md-7 col-lg-6'
                self.helper.label_class = 'col-xs-4 col-md-4 col-lg-4'
                self.helper.field_class = 'col-xs-9 col-md-8 col-lg-8'
                self.helper.add_input(Submit('submit', '저장'))
                self.helper.add_input(Button('cancel', '취소', onclick='document.location.href="%s";' % reverse('risk:risk_control_list')))

                # Remove the blank option from the select widget
                #self.fields['corp_name'].empty_label = None
                #self.fields['corp_name'].required = False

                self.helper.layout = Layout(
                    HTML(
                       '''
                        {% if messages %}
                        {% for message in messages %}
                        <p {% if message.tags %}
                        class="alert alert-{{ message.tags }}"
                        {% endif %}>{{ message }}</p>{% endfor %}{% endif %}
                        '''
                    ),
                Fieldset(
                    Field('value', placeholder='Value', required=True, autofocus=True, min=0, step='any'),
		    Field('risk_action_code', autofocus=True),
		    'control_item',
                    'risk_action',
		    'as_is',
		    'to_be',
                    'desc',
                    widgets={'submit_button_type': forms.HiddenInput()},
                )
        )

        class Meta:
                model = Risk_control
                fields = ("risk_action_code", "control_item", "risk_action", "as_is", "to_be", "desc")

class Risk_controlCreateForm(Risk_controlInputForm):

        def __init__(self, *args, **kwargs):
                super(Risk_controlCreateForm, self).__init__(*args, **kwargs)

                self.helper.add_input(Submit('submit_and_add', 'Save & Add Another', css_class='pull-right'))

class Risk_controlUpdateForm(Risk_controlInputForm):

        def __init__(self, *args, **kwargs):
                super(Risk_controlUpdateForm, self).__init__(*args, **kwargs)

                delete_url = reverse('risk:risk_control_delete', args=(self.instance.id,))

                self.helper.add_input(Button('delete', 'Delete', onclick='document.location.href="%s";' % delete_url, css_class='btn-danger pull-right'))

