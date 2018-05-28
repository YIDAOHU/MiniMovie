# -*- coding: utf-8 -*-

import uuid
import json
from datetime import datetime
from django.views.generic.base import View
from django.shortcuts import render
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from pure_pagination import Paginator, PageNotAnInteger
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q

from utils.mixin_utils import LoginRequiredMixin
from .forms import RegisterForm, LoginForm, UserInfoForm, ModifyPwdForm, CommentForm
from .models import UserProfile, UserLog
from film.models import Comment, MovieCol
from film.models import Movie, Tag


class IndexView(View):
    """
    主页
    """
    def get(self, request):
        movies = Movie.objects.all()
        tags = Tag.objects.all()
        sort = request.GET.get('sort', "")
        tag_id = request.GET.get('tag_id', "")
        star = request.GET.get('star', "")
        if sort:
            if sort == "nearest":
                movies = movies.order_by("-release_time")
            elif sort == "past":
                movies = movies.order_by("-release_time")
            elif sort == "play_high":
                movies = movies.order_by("-play_nums")
            elif sort == "play_low":
                movies = movies.order_by("play_nums")
            elif sort == "comment_high":
                movies = movies.order_by("-comment_nums")
            elif sort == "comment_low":
                movies = movies.order_by("comment_nums")
        if tag_id:
            movies = movies.filter(tag_id=int(tag_id))
        if star:
            movies = movies.filter(star=int(star))

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(movies, 8, request=request)
        movies = p.page(page)

        return render(request, 'index.html', {"movies": movies, "tags": tags,
                                              "sort": sort, "tag_id": tag_id,
                                              "star": star})


class CustomBackend(ModelBackend):
    """
    使用用户和邮箱登录
    """
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            # 不希望用户存在两个，get只能有一个。两个是get失败的一种原因 Q为使用并集查询
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            # django的后台中密码加密：所以不能password==password
            # UserProfile继承的AbstractUser中有def check_password(self, raw_password):
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class RegisterView(View):
    """
    用户注册
    """

    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {"register_form": register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            email = request.POST.get("email", "")
            if UserProfile.objects.filter(email=email):
                return render(request, 'register.html', {"msg1": "该邮箱已经注册", "register_form": register_form})
            name = request.POST.get("name", "")
            phone = request.POST.get("phone", "")
            pass_word1 = request.POST.get("password", "")
            pass_word2 = request.POST.get("repassword", "")
            if pass_word1 != pass_word2:
                return render(request, 'register.html', {"msg2": "两次输入密码不一样", "register_form": register_form})
            user = UserProfile()
            user.email = email
            user.name = name
            user.phone = phone
            user.uuid = uuid.uuid4().hex
            user.password = make_password(pass_word1)
            user.save()
            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {"register_form": register_form})


class LoginView(View):
    """
    用户登录
    """
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                login(request, user)
                log = UserLog()
                log.ip = request.META['REMOTE_ADDR']
                log.user = request.user
                log.add_time = datetime.utcnow()
                log.save()
                return HttpResponseRedirect(reverse("index"))
            else:
                return render(request, 'login.html', {"msg": "用户名或密码错误"})
        else:
            return render(request, 'login.html', {"login_form": login_form})


class LogoutView(View):
    """
    用户注销
    """
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))


class UserInfoView(LoginRequiredMixin, View):
    """
    个人中心
    """

    def get(self, request):
        return render(request, "user.html")

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, request.FILES, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponseRedirect(reverse("users:user_info"))
        else:
            # 通过json的dumps方法把字典转换为json字符串
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


class ForgetView(LoginRequiredMixin, View):
    """
    修改密码
    """
    def get(self, request):
        return render(request, 'pwd.html')

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            # 如果两次密码不相等,返回错误信息
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail", "msg":"密码不一致"}', content_type='application/json')
            # 如果密码一致
            user = request.user
            # 加密成密文
            user.password = make_password(pwd2)
            # save保存到数据库
            user.save()
            return HttpResponseRedirect(reverse("login"))
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


class CommentListView(LoginRequiredMixin, View):
    """
        评论列表
    """

    def get(self, request):
        comments = Comment.objects.filter(user=request.user)
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(comments, 4, request=request)
        comments = p.page(page)
        return render(request, 'comments.html', {"comments": comments})


class LoginLogView(LoginRequiredMixin, View):
    """
    登录日志
    """
    def get(self, request):
        logs = UserLog.objects.filter(user=request.user)
        return render(request, 'loginlog.html', {"logs": logs})


class MyMovieView(LoginRequiredMixin, View):
    """
    收藏电影
    """
    def get(self, request):
        fav_movies = MovieCol.objects.filter(user=request.user)
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(fav_movies, 4, request=request)
        fav_movies = p.page(page)
        return render(request, 'moviecol.html', {"fav_movies": fav_movies})
