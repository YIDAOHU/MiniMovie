# -*- coding: UTF-8 –*-

import xadmin

from .models import UserLog
from xadmin import views


class BaseSetting(object):
    enable_theme = True
    use_bootswatch = True


class GlobalSetting(object):
    site_title = '后台管理系统'
    site_footer = '电影分享'
    menu_style = 'accordion'


class UserLogAdmin(object):
    list_display = ['user', 'ip', 'add_time']
    search_fields = ['ip']
    list_filter = ['user', 'ip', 'add_time']


xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)
xadmin.site.register(UserLog, UserLogAdmin)


