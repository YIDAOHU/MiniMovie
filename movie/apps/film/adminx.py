# -*- coding: UTF-8 –*-

import xadmin

from .models import Tag, Movie, Preview, MovieCol, Comment


class TagAdmin(object):
    list_display = ['name', 'add_time']
    search_fields = ['name']
    list_filter = ['name', 'add_time']


class MovieAdmin(object):
    list_display = ['title', 'info', 'tag', 'add_time']
    search_fields = ['play_nums', 'tag', 'star', 'area']
    list_filter = ['title', 'info', 'tag', 'star', 'area', 'add_time']


class PreviewAdmin(object):
    list_display = ['title', 'add_time']
    search_fields = ['title']
    list_filter = ['title', 'logo', 'add_time']


class MovieColAdmin(object):
    list_display = ['movie', 'user', 'add_time']
    search_fields = ['movie']
    list_filter = ['movie', 'user', 'add_time']


class CommentAdmin(object):
    list_display = ['content', 'add_time', 'movie', 'user']
    search_fields = ['movie', 'user']
    list_filter = ['content', 'add_time']


xadmin.site.register(Tag, TagAdmin)
xadmin.site.register(Movie, MovieAdmin)
xadmin.site.register(Preview, PreviewAdmin)
xadmin.site.register(MovieCol, MovieColAdmin)
xadmin.site.register(Comment, CommentAdmin)

