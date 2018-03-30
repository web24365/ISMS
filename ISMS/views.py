from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render_to_response,redirect


def login_user(request):
    logout(request)
    username = password = ''
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/RiskManagement/')
    return render_to_response('login.html', context_instance=RequestContext(request))

class HomePage(TemplateView):
    template_name = "home.html"


class AboutPage(TemplateView):
    template_name = "about.html"

