# -*- coding: utf-8 -*- 
from __future__ import absolute_import
import logging
import operator
from django.views.generic import TemplateView
from django.views.generic import ListView
from django.views.generic import DetailView
from django.views.generic.detail import SingleObjectMixin
from django.views.generic.edit import CreateView
from django.views.generic.edit import UpdateView
from django.views.generic.edit import DeleteView
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.core.urlresolvers import reverse, reverse_lazy
from django.shortcuts import render_to_response, HttpResponse
from django.http import HttpResponseRedirect, Http404
from braces.views import LoginRequiredMixin
from django.contrib import messages
from django.template import RequestContext
from django_datatables_view.base_datatable_view import BaseDatatableView
from django.db.models import Q
from .reports import Stats

from . import models
from .models import Company, Department, Duty, Staff, Partner, Asset_valuation, Asset, Vulnerability, Threat, Mapping, Vul_analysis, Risk_analysis, Risk_control
from .forms import ( CompanyForm, CompanyCreateForm, CompanyUpdateForm, DepartmentForm, DepartmentCreateForm, DepartmentUpdateForm, DutyForm, DutyCreateForm, DutyUpdateForm, StaffForm, StaffCreateForm, StaffUpdateForm, PartnerForm, PartnerCreateForm, PartnerUpdateForm, Asset_valuationForm, Asset_valuationCreateForm, Asset_valuationUpdateForm, AssetForm, AssetCreateForm, AssetUpdateForm, VulnerabilityForm, VulnerabilityCreateForm, VulnerabilityUpdateForm, ThreatForm, ThreatCreateForm, ThreatUpdateForm, MappingForm, MappingCreateForm, MappingUpdateForm, Vul_analysisCreateForm, Vul_analysisUpdateForm, Risk_analysisCreateForm, Risk_analysisUpdateForm, Risk_controlForm, Risk_controlCreateForm, Risk_controlUpdateForm,) 

# Create your views here.

def stats_json():
	data = {'stats':Stats()._stats }
	return HttpResponse(json.dumps(data), content_type='application/json')

class RiskModel(TemplateView):
	template_name = "RiskManagement/index.html"

	def get_context_data(self, **kwargs):
		context = super(RiskModel, self).get_context_data(**kwargs)
		context['object_list'] = ['Company', 'Department', 'Duty', 'Staff', 'Partner', 'Asset_Valuation', 'Asset', 'Vulnerability', 'Threat', 'Mapping', 'Vul_analysis', 'Risk_analysis', 'Risk_control' ]
		return context

	@method_decorator(login_required)
	def dispatch(self, *args, **kwargs):
		return super(RiskModel, self).dispatch(*args, **kwargs)

# Model Company
class CompanyList(ListView):
	model = Company
	form_class = CompanyForm
	queryset = Company.objects.all()

class CompanyDetail(DetailView):
	model = Company

class CompanyDepart(SingleObjectMixin, ListView):
	#model = Company
	tempalte_name = "RiskManagement/company_detail.html"

	def get(self, request, *args, **kwargs):
        	self.object = self.get_object(queryset=Company.objects.all())
        	return super(CompanyDetail, self).get(request, *args, **kwargs)

        def get_context_data(self, **kwargs):
                context = super(CompanyDetail, self).get_context_data(**kwargs)
                context['company'] = self.object
                return context

        def get_queryset(self):
                return self.object.department_set.all()


class CompanyCreate(CreateView):
	model = Company
	success_url ='/RiskManagement/company/'
	template_name = "RiskManagement/company_create.html"
	form_class = CompanyCreateForm

	def form_valid(self, form):
	# If the 'Save & Add Another' button is clicked, the submit_button_type
        # field will be set to 'submit_and_add' by Javascript. We'll change
        # the success URL to go back to the Add Company page and display a
        # successful message in this case.
#		if form.is_valid();
#		f=form.cleaned_data['submit_button_type']
#		g=form.cleaned_data['corp_name']
#		messages.add_message(self.request, messages.SUCCESS, "----'%s'------" % f)
		if 'submit_and_add' in self.request.POST:
  		#if form.cleaned_data['submit_button_type'] == 'submit_and_add':
			self.success_url = '/RiskManagement/company/create/'
			c = form.cleaned_data['corp_name']
			messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

		#form.instance.user = self.request.user
		return super(CompanyCreate, self).form_valid(form)


	def post(self, request, *args, **kwargs):
		request.POST = request.POST.copy()
		#logger.info('New Company added by %s:%s', request.user, request.POST['value'])
		return super(CompanyCreate, self).post(request, *args, **kwargs)

#class CompanyUpdate(UpdateView):
#	model = Company
#	form_class = CompanyForm

class CompanyUpdate(UpdateView):
    model = Company
    context_object_name = 'company'
    template_name = "RiskManagement/company_update.html"
    form_class = CompanyUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(CompanyUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	#f=self.kwargs['pk']
	#messages.add_message(self.request, messages.SUCCESS, "----'%s'------" %  f)
        #return reverse('risk:company_list')
        return reverse('risk:company_detail', kwargs={ 'pk': str(self.kwargs['pk']) })
        #return reverse('risk:company_detail', args=(self.id,))

    def get_object(self, queryset=None):
        try:
            obj = Company.objects.get(pk=self.kwargs['pk'])
        except Company.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Company updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(CompanyUpdate, self).post(request, *args, **kwargs)

class CompanyDelete(DeleteView):
	model = Company
	success_url = reverse_lazy('risk:company_list')
	
	def get(self, request, *args, **kwargs):
		self.object = self.get_object()
		context = self.get_context_data(object=self.object)
		return self.render_to_response(context)

class CompanyListJson(BaseDatatableView):
    model = Company

    columns = ['id', 'corp_name', 'biz_reg_no', 'address', 'established', 'biz_type', 'representative', 'sales', 'detail', 'update', 'delete']
    order_columns = ['id', 'corp_name', 'biz_reg_no', 'address', 'established', 'biz_type', 'representative', 'sales']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'corp_name':
            return '%s' % row.corp_name
        elif column == 'biz_reg_no':
            return '%s' % row.biz_reg_no
        elif column == 'address':
            return '%s' % row.address
        elif column == 'established':
            return row.established.strftime('%Y-%m-%d')
        elif column == 'biz_type':
            return '%s' % row.biz_type
        elif column == 'representative':
           return '%s' % row.representative
        elif column == 'sales':
            return '%d' % row.sales
        elif column == 'detail':
            detail_url = reverse('risk:company_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            #detail_link = '<a href="%s"><i class="material-icons md-18">face</i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:company_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            #update_link = '<a href="%s"><i class="material-icons md-18">edit</i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:company_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            #delete_link = '<a href="%s"><i class="material-icons md-18">clear</i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(CompanyListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
	queryset = Company.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        #if search:
        #    qs = qs.filter(
        #        Q(value__startswith=search) |
        #        Q(company__corp_name__istartswith=search) |
        #        reduce(operator.and_, (Q(notes__icontains=i) for i in search.split())) |
        #        reduce(operator.and_, (Q(tags__name__icontains=i) for i in search.split()))
        #    )

        #start_date = params.get('start_date', '')
        #if start_date:
        #    qs = qs.filter(record_date__gte=datetime.strptime(
        #        start_date, DATE_FORMAT))
        #    
        #end_date = params.get('end_date', '')
        #if end_date:
        #    qs = qs.filter(record_date__lte=datetime.strptime(
        #        end_date, DATE_FORMAT))
#
#        start_value = params.get('start_value', '')
#        if start_value:
#            qs = qs.filter(value__gte=start_value)
#            
#        end_value = params.get('end_value', '')
#        if end_value:
#            qs = qs.filter(value__lte=end_value)

        corp_name = params.get('corp_name', '')
        if corp_name:
            qs = qs.filter(corp_name=corp_name)

        address = params.get('address', '')
        if address:
            qs = qs.filter(reduce(
                operator.and_, (Q(address__icontains=i) for i in address.split())))

        sales = params.get('sales', '')
        if sales:
            qs = qs.filter(sales__name=sales)

        return qs

# model Department
class DepartmentList(ListView):
	model = Department

	@method_decorator(login_required)
        def dispatch(self, *args, **kwargs):
                return super(DepartmentList, self).dispatch(*args, **kwargs)


class DepartmentDetail(DetailView):
        model = Department

class DepartmentCreate(CreateView):
        model = Department
        success_url ='/RiskManagement/department/'
        template_name = "RiskManagement/department_create.html"
        form_class = DepartmentCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/department/create/'
                        c = form.cleaned_data['depart']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(DepartmentCreate, self).form_valid(form)


        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Department added by %s:%s', request.user, request.POST['value'])
                return super(DepartmentCreate, self).post(request, *args, **kwargs)

class DepartmentUpdate(UpdateView):
    model = Department
    context_object_name = 'department'
    template_name = "RiskManagement/department_update.html"
    form_class = DepartmentUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(DepartmentUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
        return reverse('risk:department_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Department.objects.get(pk=self.kwargs['pk'])
        except Department.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        request.POST = request.POST.copy()

        #logger.info('Department updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(DepartmentUpdate, self).post(request, *args, **kwargs)

class DepartmentDelete(DeleteView):
        model = Department
        success_url = reverse_lazy('risk:Department_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class DepartmentListJson(BaseDatatableView):
    model = Department

    columns = ['id', 'corpinfo', 'depart', 'desc', 'detail', 'update', 'delete']
    order_columns = ['id', 'corpinfo', 'depart', 'desc']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'corpinfo':
            return '%s' % row.corpinfo
        elif column == 'depart':
            return '%s' % row.depart
        elif column == 'desc':
            return '%s' % row.desc
        elif column == 'detail':
            detail_url = reverse('risk:department_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:department_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:department_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(DepartmentListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Department.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(corpinfo__startswith=search) |
         	Q(depart__istartswith=search) |
         	Q(desc__istartswith=search)
            )

        return qs

# model Duty
class DutyList(ListView):
	model = Duty

class DutyDetail(DetailView):
        model = Duty

class DutyCreate(CreateView):
        model = Duty
        success_url ='/RiskManagement/duty/'
        template_name = "RiskManagement/duty_create.html"
        form_class = DutyCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/duty/create/'
                        c = form.cleaned_data['duty']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(DutyCreate, self).form_valid(form)


        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Company added by %s:%s', request.user, request.POST['value'])
                return super(DutyCreate, self).post(request, *args, **kwargs)

class DutyUpdate(UpdateView):
    model = Duty
    context_object_name = 'duty'
    template_name = "RiskManagement/duty_update.html"
    form_class = DutyUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(DutyUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
        return reverse('risk:duty_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Duty.objects.get(pk=self.kwargs['pk'])
        except Duty.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Company updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(DutyUpdate, self).post(request, *args, **kwargs)

class DutyDelete(DeleteView):
        model = Duty
        success_url = reverse_lazy('risk:duty_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)


class DutyListJson(BaseDatatableView):
    model = Duty

    columns = ['id', 'duty', 'outline', 'desc', 'detail', 'update', 'delete']
    order_columns = ['id', 'duty', 'outline']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'duty':
            return '%s' % row.duty
        elif column == 'outline':
            return '%s' % row.outline
        elif column == 'desc':
            return '%s' % row.desc
        elif column == 'detail':
            detail_url = reverse('risk:duty_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            #detail_link = '<a href="%s"><i class="material-icons md-18">face</i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:duty_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:duty_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(DutyListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Duty.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        #if search:
        #    qs = qs.filter(
        #        Q(value__startswith=search) |
        #        Q(company__corp_name__istartswith=search) |
        #        reduce(operator.and_, (Q(notes__icontains=i) for i in search.split())) |
        #        reduce(operator.and_, (Q(tags__name__icontains=i) for i in search.split()))
        #    )

        duty = params.get('duty', '')
        if duty:
            qs = qs.filter(duty=duty)

        outline = params.get('outline', '')
        if outline:
            qs = qs.filter(reduce(
                operator.and_, (Q(outline__icontains=i) for i in outline.split())))

        desc = params.get('desc', '')
        if desc:
            qs = qs.filter(desc__name=desc)

        return qs



# model Staff
class StaffList(ListView):
	model = Staff

class StaffDetail(DetailView):
        model = Staff

class StaffCreate(CreateView):
        model = Staff
        success_url ='/RiskManagement/staff/'
        template_name = "RiskManagement/staff_create.html"
        form_class = StaffCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/staff/create/'
                        c = form.cleaned_data['name']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(StaffCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Staff added by %s:%s', request.user, request.POST['value'])
                return super(StaffCreate, self).post(request, *args, **kwargs)

class StaffUpdate(UpdateView):
    model = Staff
    context_object_name = 'staff'
    template_name = "RiskManagement/staff_update.html"
    form_class = StaffUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(StaffUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
        return reverse('risk:staff_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Staff.objects.get(pk=self.kwargs['pk'])
        except Staff.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Staff updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(StaffUpdate, self).post(request, *args, **kwargs)

class StaffDelete(DeleteView):
        model = Staff
        success_url = reverse_lazy('risk:staff_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class StaffListJson(BaseDatatableView):
    model = Staff

    columns = ['id', 'name', 'depart', 'duty', 'position', 'location', 'detail', 'update', 'delete']
    order_columns = ['id', 'name', 'depart', 'duty', 'position', 'location']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'name':
            return '%s' % row.name
        elif column == 'depart':
            return '%s' % row.depart
        elif column == 'duty':
            return '%s' % row.duty
        elif column == 'position':
            return '%s' % row.position
        elif column == 'location':
            return '%s' % row.location
        elif column == 'detail':
            detail_url = reverse('risk:staff_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:staff_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:staff_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(StaffListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Staff.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        #if search:
        #    qs = qs.filter(
        #        Q(value__startswith=search) |
 	#        Q(company__corp_name__istartswith=search) |
        #        reduce(operator.and_, (Q(notes__icontains=i) for i in search.split())) |
        #        reduce(operator.and_, (Q(tags__name__icontains=i) for i in search.split()))
        #    )
	name = params.get('name', '')
        if name:
            qs = qs.filter(name=name)

        depart = params.get('depart', '')
        if depart:
            qs = qs.filter(reduce(
                operator.and_, (Q(outline__icontains=i) for i in outline.split())))

        duty = params.get('duty', '')
        if duty:
            qs = qs.filter(duty=duty)

        position = params.get('position', '')
        if position:
            qs = qs.filter(position=position)

        location = params.get('location', '')
        if location:
            qs = qs.filter(location=location)


        return qs


# model Partner
class PartnerList(ListView):
        model = Partner 

class PartnerDetail(DetailView):
        model = Partner 

class PartnerCreate(CreateView):
        model = Partner
        success_url ='/RiskManagement/partner/'
        template_name = "RiskManagement/partner_create.html"
        form_class = PartnerCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/partner/create/'
                        c = form.cleaned_data['name']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(PartnerCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Partner added by %s:%s', request.user, request.POST['value'])
                return super(PartnerCreate, self).post(request, *args, **kwargs)

class PartnerUpdate(UpdateView):
    model = Partner
    context_object_name = 'partner'
    template_name = "RiskManagement/partner_update.html"
    form_class = PartnerUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(PartnerUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:partner_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Partner.objects.get(pk=self.kwargs['pk'])
        except Partner.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Partner updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(PartnerUpdate, self).post(request, *args, **kwargs)

class PartnerDelete(DeleteView):
        model = Partner
        success_url = reverse_lazy('risk:Partner_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class PartnerListJson(BaseDatatableView):
    model = Partner

    columns = ['id', 'name', 'outline', 'desc', 'detail', 'update', 'delete']
    order_columns = ['id', 'name', 'outlie', 'desc']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'name':
            return '%s' % row.name
        elif column == 'outline':
            return '%s' % row.outline
        elif column == 'desc':
            return '%s' % row.desc
        elif column == 'detail':
            detail_url = reverse('risk:partner_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:partner_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:partner_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(PartnerListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Partner.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        #if search:
        #    qs = qs.filter(
        #        Q(value__startswith=search) |
 	#        Q(company__corp_name__istartswith=search) |
        #        reduce(operator.and_, (Q(notes__icontains=i) for i in search.split())) |
        #        reduce(operator.and_, (Q(tags__name__icontains=i) for i in search.split()))
        #    )
	name = params.get('name', '')
        if name:
            qs = qs.filter(name=name)

        outline = params.get('outline', '')
        if outline:
            qs = qs.filter(reduce(
                operator.and_, (Q(outline__icontains=i) for i in outline.split())))

        desc = params.get('desc', '')
        if desc:
            qs = qs.filter(desc__name=desc)

        return qs

# model Asset_valuation
class Asset_valuationList(ListView):
        model = Asset_valuation

class Asset_valuationDetail(DetailView):
        model = Asset_valuation

class Asset_valuationCreate(CreateView):
        model = Asset_valuation
        success_url ='/RiskManagement/asset_valuation/'
        template_name = "RiskManagement/asset_valuation_create.html"
        form_class = Asset_valuationCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/asset_valuation/create/'
                        c = form.cleaned_data['valuation_code']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(Asset_valuationCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Partner added by %s:%s', request.user, request.POST['value'])
                return super(Asset_valuationCreate, self).post(request, *args, **kwargs)

class Asset_valuationUpdate(UpdateView):
    model = Asset_valuation
    context_object_name = 'asset_valuation'
    template_name = "RiskManagement/asset_valuation_update.html"
    form_class = Asset_valuationUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(Asset_valuationUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:asset_valuation_detail', kwargs={ 'pk': str(self.kwargs['pk']) })


    def get_object(self, queryset=None):
        try:
            obj = Asset_valuation.objects.get(pk=self.kwargs['pk'])
        except Asset_valuation.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Asset_valuation updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(Asset_valuationUpdate, self).post(request, *args, **kwargs)

class Asset_valuationDelete(DeleteView):
        model = Asset_valuation
        success_url = reverse_lazy('risk:asset_valuation_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class Asset_valuationListJson(BaseDatatableView):
    model = Asset_valuation

    columns = ['id', 'valuation_code', 'cia', 'rating', 'desc', 'detail', 'update', 'delete']
    order_columns = ['id', 'valuation_code', 'cia', 'rating', 'desc']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'valuation_code':
            return '%s' % row.valuation_code
        elif column == 'cia':
            return '%s' % row.cia
        elif column == 'rating':
            return '%s' % row.rating
        elif column == 'detail':
            detail_url = reverse('risk:asset_valuation_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:asset_valuation_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:asset_valuation_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(Asset_valuationListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Asset_valuation.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        #if search:
        #    qs = qs.filter(
        #        Q(value__startswith=search) |
 	#        Q(company__corp_name__istartswith=search) |
        #        reduce(operator.and_, (Q(notes__icontains=i) for i in search.split())) |
        #        reduce(operator.and_, (Q(tags__name__icontains=i) for i in search.split()))
        #    )
	valuation_code = params.get('valuation_code', '')
        if valuation_code:
            qs = qs.filter(valuation_code=valuation_code)

        cia = params.get('cia', '')
        if cia:
            qs = qs.filter(reduce(
                operator.and_, (Q(outline__icontains=i) for i in outline.split())))

        rating = params.get('rating', '')
        if rating:
            qs = qs.filter(rating=rating)

        return qs


# model Asset
class AssetList(ListView):
	model = Asset
	queryset = Asset.objects.all()
	paginate_by = 10

class AssetDetail(DetailView):
        model = Asset

class AssetCreate(CreateView):
        model = Asset
        success_url ='/RiskManagement/asset/'
        template_name = "RiskManagement/asset_create.html"
        form_class = AssetCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/asset/create/'
                        c = form.cleaned_data['asset_name']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(AssetCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Company added by %s:%s', request.user, request.POST['value'])
                return super(AssetCreate, self).post(request, *args, **kwargs)

class AssetUpdate(UpdateView):
    model = Asset
    context_object_name = 'asset'
    template_name = "RiskManagement/asset_update.html"
    form_class = AssetUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(AssetUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:asset_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Asset.objects.get(pk=self.kwargs['pk'])
        except Asset.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Asset updated by %s, asset id: %s', request.user, kwargs['pk']) 
        return super(AssetUpdate, self).post(request, *args, **kwargs)

class AssetDelete(DeleteView):
        model = Asset
        success_url = reverse_lazy('risk:asset_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class AssetListJson(BaseDatatableView):
    model = Asset

    #columns = ['id', 'asset_code', 'asset_class', 'asset_name', 'staff_name', 'use', 'cnt', 'model', 'made', 'url', 'os', 'version', 'ip', 'mac', 'location', 'archive', 'confidential', 'integrity', 'availability', 'text', 'detail', 'update', 'delete']
    columns = ['id', 'asset_code', 'asset_class', 'asset_name', 'staff_name', 'use', 'confidential', 'integrity', 'availability', 'asset_score', 'detail', 'update', 'delete']
    order_columns = ['id', 'asset_code', 'asset_class', 'asset_name', 'staff_name', 'use', 'confidential', 'integrity', 'availability', 'asset_score' ]
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'asset_code':
            return '%s' % row.asset_code
        elif column == 'asset_class':
            return '%s' % row.asset_class
        elif column == 'asset_name':
            return '%s' % row.asset_name
        elif column == 'staff_name':
            return '%s' % row.staff_name
        elif column == 'use':
            return '%s' % row.use
        #elif column == 'cnt':
        #    return '%s' % row.cnt
        #elif column == 'model':
        #    return '%s' % row.model
        #elif column == 'made':
        #    return '%s' % row.made
        #elif column == 'url':
        #    return '%s' % row.url
        #elif column == 'os':
        #    return '%s' % row.os
        #elif column == 'version':
        #    return '%s' % row.version
        #elif column == 'ip':
        #    return '%s' % row.ip
        #elif column == 'mac':
        #    return '%s' % row.mac
        #elif column == 'location':
        #    return '%s' % row.location
        #elif column == 'archive':
            return '%s' % row.archive
        elif column == 'confidential':
            return '%s' % row.confidential
        elif column == 'integrity':
            return '%s' % row.integrity
        elif column == 'availability':
            return '%s' % row.availability
        elif column == 'asset_score':
            return '%s' % row.asset_score
        #elif column == 'text':
        #    return '%s' % row.text
        elif column == 'detail':
            detail_url = reverse('risk:asset_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            #detail_link = '<a href="%s"><i class="material-icons md-18">face</i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:asset_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:asset_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(AssetListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Asset.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(asset_code__istartswith=search) | 
		Q(asset_class__istartswith=search) |
		Q(asset_name__istartswith=search) |
		Q(staff_name__istartswith=search) |
		Q(use__istartswith=search) |
		Q(model__istartswith=search) |
		Q(made__istartswith=search)
            )
        return qs


# model Vulnerability
class VulnerabilityList(ListView):
	model = Vulnerability

class VulnerabilityDetail(DetailView):
        model = Vulnerability

class VulnerabilityCreate(CreateView):
        model = Vulnerability
        success_url ='/RiskManagement/vul/'
        template_name = "RiskManagement/vulnerability_create.html"
        form_class = VulnerabilityCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/vul/create/'
                        c = form.cleaned_data['vul_code']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(VulnerabilityCreate, self).form_valid(form)


        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Company added by %s:%s', request.user, request.POST['value'])
                return super(VulnerabilityCreate, self).post(request, *args, **kwargs)

class VulnerabilityUpdate(UpdateView):
    model = Vulnerability
    context_object_name = 'vulnerability'
    template_name = "RiskManagement/vulnerability_update.html"
    form_class = VulnerabilityUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(VulnerabilityUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:vulnerability_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Vulnerability.objects.get(pk=self.kwargs['pk'])
        except Vulnerability.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Vulnerability updated by %s, company id: %s', request.user, kwargs['pk']) 
        return super(VulnerabilityUpdate, self).post(request, *args, **kwargs)

class VulnerabilityDelete(DeleteView):
        model = Vulnerability
        success_url = reverse_lazy('risk:vulnerability_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class VulnerabilityListJson(BaseDatatableView):
    model = Vulnerability

    columns = ['id', 'vul_code', 'classification', 'subclass', 'entry', 'rating', 'detail', 'update', 'delete']
    order_columns = ['id', 'vul_code', 'classification', 'subclass', 'entry', 'rating']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'vul_code':
            return '%s' % row.vul_code
        elif column == 'classification':
            return '%s' % row.classification
        elif column == 'subclass':
            return '%s' % row.subclass
        elif column == 'entry':
            return '%s' % row.entry
        elif column == 'rating':
            return '%s' % row.rating
        elif column == 'desc':
            return '%s' % row.desc
        elif column == 'control':
            return '%s' % row.control
        elif column == 'detail':
            detail_url = reverse('risk:vulnerability_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:vulnerability_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:vulnerability_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(VulnerabilityListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Vulnerability.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(vul_code__startswith=search) | 
		Q(classification__istartswith=search) |
		Q(subclass__istartswith=search) |
		Q(entry__istartswith=search) |
                reduce(operator.and_, (Q(desc__icontains=i) for i in search.split())) |
                reduce(operator.and_, (Q(control__icontains=i) for i in search.split()))
            )
#	vul_code = params.get('vul_code', '')
#        if vul_code:
#            qs = qs.filter(vul_code=vul_code)
##
#        classification = params.get('classification', '')
#        if classification:
#            qs = qs.filter(reduce(
#                operator.and_, (Q(outline__icontains=i) for i in outline.split())))
#
#        category = params.get('category', '')
#        if category:
#            qs = qs.filter(category=category)
#
#        entry = params.get('entry', '')
#        if entry:
#            qs = qs.filter(entry=entry)
#
#        desc = params.get('desc', '')
#        if desc:
#            qs = qs.filter(desc=desc)
#
#        rating = params.get('rating', '')
#        if rating:
#            qs = qs.filter(rating=rating)

        return qs

# model Threat
class ThreatList(ListView):
	model = Threat

class ThreatDetail(DetailView):
        model = Threat

class ThreatCreate(CreateView):
        model = Threat
        success_url ='/RiskManagement/threat/'
        template_name = "RiskManagement/threat_create.html"
        form_class = ThreatCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/threat/create/'
                        c = form.cleaned_data['threat_code']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(ThreatCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Threat added by %s:%s', request.user, request.POST['value'])
                return super(ThreatCreate, self).post(request, *args, **kwargs)

class ThreatUpdate(UpdateView):
    model = Threat
    context_object_name = 'threat'
    template_name = "RiskManagement/threat_update.html"
    form_class = ThreatUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(ThreatUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:threat_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Threat.objects.get(pk=self.kwargs['pk'])
        except Threat.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Threat updated by %s, threat id: %s', request.user, kwargs['pk']) 
        return super(ThreatUpdate, self).post(request, *args, **kwargs)

class ThreatDelete(DeleteView):
        model = Threat
        success_url = reverse_lazy('risk:threat_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class ThreatListJson(BaseDatatableView):
    model = Threat

    columns = ['id', 'threat_code', 'category', 'actor', 'outcome', 'impact', 'frequency', 'threat_score', 'detail', 'update', 'delete']
    order_columns = ['id', 'threat_code', 'category', 'actor', 'outcome', 'scenario', 'impact', 'frequency']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'threat_code':
            return '%s' % row.threat_code
        elif column == 'category':
            return '%s' % row.category
        elif column == 'actor':
            return '%s' % row.actor
        elif column == 'outcome':
            return '%s' % row.outcome
        #elif column == 'scenario':
        #    return '%s' % row.scenario
        elif column == 'impact':
            return '%s' % row.impact
        elif column == 'frequency':
            return '%s' % row.frequency
        elif column == 'threat_score':
            return '%s' % row.threat_score
        elif column == 'detail':
            detail_url = reverse('risk:threat_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:threat_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:threat_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(ThreatListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Threat.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(threat_code__startswith=search) |
 	        Q(category__istartswith=search) |
 	        Q(actor__istartswith=search) |
 	        Q(outcome__istartswith=search) |
                reduce(operator.and_, (Q(scenario__icontains=i) for i in search.split())) |
 	        Q(impact__istartswith=search) |
 	        Q(frequency__istartswith=search)
            )
        return qs

# model Mapping
class MappingList(ListView):
	model = Mapping

class MappingDetail(DetailView):
        model = Mapping

class MappingCreate(CreateView):
        model = Mapping
        success_url ='/RiskManagement/mapping/'
        template_name = "RiskManagement/mapping_create.html"
        form_class = MappingCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/mapping/create/'
                        c = form.cleaned_data['name']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(MappingCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Staff added by %s:%s', request.user, request.POST['value'])
                return super(MappingCreate, self).post(request, *args, **kwargs)

class MappingUpdate(UpdateView):
    model = Mapping
    context_object_name = 'mapping'
    template_name = "RiskManagement/mapping_update.html"
    form_class = MappingUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(MappingUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:mapping_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Mapping.objects.get(pk=self.kwargs['pk'])
        except Mapping.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Mapping updated by %s, Mapping id: %s', request.user, kwargs['pk']) 
        return super(MappingUpdate, self).post(request, *args, **kwargs)

class MappingDelete(DeleteView):
        model = Mapping
        success_url = reverse_lazy('risk:mapping_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class MappingListJson(BaseDatatableView):
    model = Mapping

    columns = ['id', 'mapping_code', 'asset', 'by_vul_analysis', 'by_threat', 'detail', 'update', 'delete']
    order_columns = ['id', 'mapping_code', 'asset']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'mapping_code':
            return '%s' % row.mapping_code
        elif column == 'asset':
            return '%s' % row.asset
        elif column == 'by_vul_analysis':
            return '%s' % row.by_vul_analysis
        elif column == 'by_threat':
            return '%s' % row.by_threat
        elif column == 'detail':
            detail_url = reverse('risk:mapping_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:mapping_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:mapping_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(MappingListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Mapping.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(mapping_code__startswith=search) |
 	        Q(asset__istartswith=search)
            )
        return qs

# model Vul_analysis
class Vul_analysisList(ListView):
	model = Vul_analysis

class Vul_analysisDetail(DetailView):
        model = Vul_analysis

class Vul_analysisCreate(CreateView):
        model = Vul_analysis
        success_url ='/RiskManagement/vul_analysis/'
        template_name = "RiskManagement/vul_analysis_create.html"
        form_class = Vul_analysisCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/vul_analysis/create/'
                        c = form.cleaned_data['asset_name']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(Vul_analysisCreate, self).form_valid(form)


        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Vulnerability Analysis added by %s:%s', request.user, request.POST['value'])
                return super(Vul_analysisCreate, self).post(request, *args, **kwargs)

class Vul_analysisUpdate(UpdateView):
    model = Vul_analysis
    context_object_name = 'vul_analysis'
    template_name = "RiskManagement/vul_analysis_update.html"
    form_class = Vul_analysisUpdateForm


    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(Vul_analysisUpdate, self).get(request, *args, **kwargs)
	
    def get_success_url(self):
	return reverse('risk:vul_analysis_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Vul_analysis.objects.get(pk=self.kwargs['pk'])
        except Vul_analysis.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Vul_analysis updated by %s, Vul_analysis id: %s', request.user, kwargs['pk']) 
        return super(Vul_analysisUpdate, self).post(request, *args, **kwargs)

class Vul_analysisDelete(DeleteView):
        model = Vul_analysis
        success_url = reverse_lazy('risk:vul_analysis_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class Vul_analysisListJson(BaseDatatableView):
    model = Vul_analysis

    columns = ['id', 'asset', 'vul', 'vul.entry', 'isapplied', 'vul_score', 'created', 'updated', 'detail', 'update', 'delete']
    order_columns = ['id', 'asset', 'vul', 'vul.entry', 'isapplied', 'vul_score', 'created', 'updated']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'asset':
            return '%s' % row.asset
        elif column == 'vul':
            return '%s' % row.vul
        elif column == 'vul_code.entry':
            return '%s' % row.vul.entry
        elif column == 'isapplied':
            return '%s' % row.isapplied
        elif column == 'vul_score':
            return '%s' % row.vul_score
        elif column == 'created':
            return '%s' % row.created
        elif column == 'updated':
            return '%s' % row.updated
        elif column == 'detail':
            detail_url = reverse('risk:vul_analysis_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:vul_analysis_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:vul_analysis_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(Vul_analysisListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Vul_analysis.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(vul_code__vul_code__istartswith=search) |
 	        Q(asset__asset_name__istartswith=search)
            )
	vul_code = params.get('vul_code', '')
        if vul_code:
            qs = qs.filter(vul_code=vul_code)

        asset = params.get('asset', '')
        if asset:
            qs = qs.filter(reduce(
                operator.and_, (Q(outline__icontains=i) for i in outline.split())))

        return qs

# model Risk_analysis
class Risk_analysisList(ListView):
	model = Risk_analysis

class Risk_analysisDetail(DetailView):
        model = Risk_analysis

class Risk_analysisCreate(CreateView):
        model = Risk_analysis
        success_url ='/RiskManagement/risk_analysis/'
        template_name = "RiskManagement/risk_analysis_create.html"
        form_class = Risk_analysisCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/risk_analysis/create/'
                        c = form.cleaned_data['risk_code']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(Risk_analysisCreate, self).form_valid(form)

        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Risk_analysis added by %s:%s', request.user, request.POST['value'])
                return super(Risk_analysisCreate, self).post(request, *args, **kwargs)

class Risk_analysisUpdate(UpdateView):
    model = Risk_analysis
    context_object_name = 'risk_analysis'
    template_name = "RiskManagement/risk_analysis_update.html"
    form_class = Risk_analysisUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(Risk_analysisUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:risk_analysis_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Risk_analysis.objects.get(pk=self.kwargs['pk'])
        except Risk_analysis.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Risk_analysis updated by %s, Risk_analysis id: %s', request.user, kwargs['pk']) 
        return super(Risk_analysisUpdate, self).post(request, *args, **kwargs)

class Risk_analysisDelete(DeleteView):
        model = Risk_analysis
        success_url = reverse_lazy('risk:risk_analysis_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class Risk_analysisListJson(BaseDatatableView):
    model = Risk_analysis

    columns = ['id', 'asset', 'vul', 'threat', 'risk_score', 'created', 'detail', 'update', 'delete']
    order_columns = ['id', 'asset', 'vul', 'threat', 'risk_score', 'created' ]
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'asset':
            return '%s' % row.vul.asset
        elif column == 'vul':
            return '%s' % row.vul.vul.desc
        elif column == 'threat':
            return '%s' % row.threat
        elif column == 'risk_score':
            return '%s' % row.risk_score
        elif column == 'created':
            return '%s' % row.created
        elif column == 'detail':
            detail_url = reverse('risk:risk_analysis_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:risk_analysis_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:risk_analysis_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(Risk_analysisListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Risk_analysis.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(asset__startswith=search) |
 	        Q(vul__entry__istartswith=search) |
 	        Q(threat__corp_name__istartswith=search) |
 	        Q(risk_score__istartswith=search)
            )
        return qs


# model Risk_control
class Risk_controlList(ListView):
	model = Risk_control

class Risk_controlDetail(DetailView):
        model = Risk_control

class Risk_controlCreate(CreateView):
        model = Risk_control
        success_url ='/RiskManagement/risk_control/'
        template_name = "RiskManagement/risk_control_create.html"
        form_class = Risk_controlCreateForm

        def form_valid(self, form):
                if 'submit_and_add' in self.request.POST:
                        self.success_url = '/RiskManagement/risk_control/create/'
                        c = form.cleaned_data['risk_action']
                        messages.add_message(self.request, messages.SUCCESS, u"'%s'를(을) 성공적으로 저장되었습니다. 추가 입력하십시오." % c)

                #form.instance.user = self.request.user
                return super(Risk_controlCreate, self).form_valid(form)


        def post(self, request, *args, **kwargs):
                request.POST = request.POST.copy()
                #logger.info('New Risk_control added by %s:%s', request.user, request.POST['value'])
                return super(Risk_controlCreate, self).post(request, *args, **kwargs)

class Risk_controlUpdate(UpdateView):
    model = Risk_control
    context_object_name = 'risk_control'
    template_name = "RiskManagement/risk_control_update.html"
    form_class = Risk_controlUpdateForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()

        # If the record's user doesn't match the currently logged-in user,
        # deny viewing/updating of the object by showing the 403.html
        # forbidden page. This can occur when the user changes the id in
        # the URL field to a record that the user doesn't own.
        #if self.object.user != request.user:
        #    raise PermissionDenied
        #else:
        return super(Risk_controlUpdate, self).get(request, *args, **kwargs)

    def get_success_url(self):
	return reverse('risk:risk_control_detail', kwargs={ 'pk': str(self.kwargs['pk']) })

    def get_object(self, queryset=None):
        try:
            obj = Risk_control.objects.get(pk=self.kwargs['pk'])
        except Risk_control.DoesNotExist:
            raise Http404

        return obj

    def post(self, request, *args, **kwargs):
        # We need to create a copy of request.POST because it's immutable and
        # we need to convert the content of the Value field to mg/dL if the
        # user's glucose unit setting is set to mmol/L.
        request.POST = request.POST.copy()

        #logger.info('Risk_control updated by %s, Risk_control id: %s', request.user, kwargs['pk']) 
        return super(Risk_controlUpdate, self).post(request, *args, **kwargs)

class Risk_controlDelete(DeleteView):
        model = Risk_control
        success_url = reverse_lazy('risk:risk_control_list')

        def get(self, request, *args, **kwargs):
                self.object = self.get_object()
                context = self.get_context_data(object=self.object)
                return self.render_to_response(context)

class Risk_controlListJson(BaseDatatableView):
    model = Risk_control

    columns = ['id', 'risk_action_code', 'control_item', 'risk_action', 'as_is', 'to_be', 'desc', 'created', 'updated', 'detail', 'update', 'delete']
    order_columns = ['id', 'risk_action_code', 'control_item', 'risk_action', 'as_is', 'to_be', 'desc', 'created', 'updated']
    max_display_length = 500

    def render_column(self, row, column):
        if column == 'id':
            return '%s' % row.id
        elif column == 'risk_action_code':
            return '%s' % row.risk_action_code
        elif column == 'control_item':
            return '%s' % row.control_item
        elif column == 'risk_action':
            return '%s' % row.risk_action
        elif column == 'as_is':
            return '%s' % row.as_is
        elif column == 'to_be':
            return '%s' % row.to_be
        elif column == 'desc':
            return '%s' % row.desc
        elif column == 'created':
            return '%s' % row.created
        elif column == 'detail':
            detail_url = reverse('risk:risk_control_detail', args=(row.id,))
            detail_link = '<a href="%s"><i class="fa fa-eye text-fw"></i></a>' % detail_url
            return '<center>%s</center>' % detail_link
        elif column == 'update':
            update_url = reverse('risk:risk_control_update', args=(row.id,))
            update_link = '<a href="%s"><i class="fa fa-pencil text-fw"></i></a>' % update_url
            return '<center>%s</center>' % update_link
        elif column == 'delete':
            delete_url = reverse('risk:risk_control_delete', args=(row.id,))
            delete_link = '<a href="%s"><i class="fa fa-times text-danger"></i></a>' % delete_url
            return '<center>%s</center>' % delete_link
        else:
            return super(Risk_controlListJson, self).render_column(row, column)

    def get_initial_queryset(self):
        """
        Filter records to show only entries from the currently logged-in user.
        """
        queryset = Risk_control.objects.all()
        return queryset

    def filter_queryset(self, qs):
        params = self.request.GET

        search = params.get('sSearch')
        if search:
            qs = qs.filter(
                Q(control_item__startswith=search) |
 	        Q(risk_action__istartswith=search) |
 	        Q(as_is__istartswith=search) |
 	        Q(to_be__istartswith=search) |
                reduce(operator.and_, (Q(desc__icontains=i) for i in search.split()))
            )
        return qs


