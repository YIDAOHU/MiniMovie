# -*- coding:utf-8 -*-

from django import forms
from .models import UserProfile


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True)


class RegisterForm(forms.Form):
    name = forms.CharField(required=True)
    email = forms.EmailField(required=True)
    phone = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)
    repassword = forms.CharField(required=True, min_length=5)


class ModifyPwdForm(forms.Form):

    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)


class CommentForm(forms.Form):
    content = forms.CharField(required=True)


class UserInfoForm(forms.ModelForm):
    """
    用于个人中心修改个人信息
    """
    class Meta:
        model = UserProfile
        fields = ['name', 'email', 'phone', 'image', 'info']