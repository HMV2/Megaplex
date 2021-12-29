from django.shortcuts import redirect, render
from django.contrib.auth import logout

from admins.models import Category


def index_page(request):
    return render(request, 'homepage/homepage.html')


def logout_view(request):
    logout(request)
    return redirect('/')


def category(request):
    data = Category.objects.all().order_by('-id')
    context = {
        'data': data
    }
    return render(request, 'homepage/category.html', context)

# data = Country.objects.all().order_by('-id')
#     # country_filter = CountryFilter(request.GET, queryset=data)
#     context = {
#         'data': data,
#         'activate_explore': 'active border-bottom active-class',
#         # 'country_filter': country_filter
#     }
#     return render(request, 'dashboard/country.html', context)
