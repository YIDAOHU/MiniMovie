# -*- coding:utf-8 -*-

from django import template

register = template.Library()


@register.filter
def star_list(star):
    return [i for i in range(star)]
