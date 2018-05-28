# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime


class UserProfile(AbstractUser):
    name = models.CharField(max_length=50, verbose_name='昵称', default='')
    birthday = models.DateField(verbose_name='生日', null=True, blank=True)
    gender = models.CharField(choices=(("male", "男"), ("female", "女")), default='female', max_length=6)
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name='手机号码')
    info = models.TextField(verbose_name="个人简介", default='')
    image = models.ImageField(upload_to='image/%Y/%m', default='image/default.png', max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    uuid = models.CharField(max_length=50, verbose_name='唯一标志符', default='')

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username


class UserLog(models.Model):
    user = models.ForeignKey(UserProfile, default='', on_delete=models.CASCADE, verbose_name='用户')
    ip = models.CharField(max_length=50, verbose_name='登录ip', default='')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='登录时间')

    class Meta:
        verbose_name = '登录日志'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.user
