# -*- coding:utf-8 -*-

from django.conf.urls import url
from .views import UserInfoView, ForgetView, CommentListView, LoginLogView, MyMovieView

urlpatterns = [
    # 用户信息
    url(r'^info/$', UserInfoView.as_view(), name="user_info"),
    # 修改密码
    url('forget/pwd/', ForgetView.as_view(), name="forget_pwd"),
    # 我的评论
    url(r'^comment/$', CommentListView.as_view(), name='comment'),
    # 登录日志
    url(r'^log/$', LoginLogView.as_view(), name='login_log'),
    # 电影收藏
    url('fav_movie/', MyMovieView.as_view(), name="my_movie")
]