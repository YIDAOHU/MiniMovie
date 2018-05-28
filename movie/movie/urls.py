# -*- coding: UTF-8 –*-

"""movie URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
import xadmin
from django.views.static import serve
from movie.settings import MEDIA_ROOT, STATIC_ROOT
from users.views import IndexView, RegisterView, LogoutView, LoginView
from film.views import AnimationView, SearchView, MovieDetailView, CommentView, FavMovieView

urlpatterns = [
    url(r'^admin/', xadmin.site.urls),
    # 首页
    url(r'^$', IndexView.as_view(), name='index'),
    # 注册
    url(r'^register/$', RegisterView.as_view(), name='register'),
    # 登录
    url(r'^login/$', LoginView.as_view(), name='login'),
    # 注销
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    # 轮播图
    url(r'^animation/$', AnimationView.as_view(), name='animation'),
    # 搜索
    url(r'^search/$', SearchView.as_view(), name='search'),
    # 详情
    url(r'^detail/(?P<movie_id>.*)/$', MovieDetailView.as_view(), name='detail'),
    # 添加评论
    url(r'^comment/$', CommentView.as_view(), name='comment'),
    # 添加收藏
    url(r'^likes/$', FavMovieView.as_view(), name='fav'),
    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    # 静态文件
    url(r'^static/(?P<path>.*)$', serve, {"document_root": STATIC_ROOT}),
    # 个人信息相关url
    url(r'^users/', include('users.urls', namespace='users'))
]

# 全局404和500页面
handler404 = 'film.views.page_not_found'
handler500 = 'film.views.page_error'