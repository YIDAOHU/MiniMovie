# -*- coding: utf-8 -*-

from django.shortcuts import render, render_to_response
from django.views.generic.base import View
from django.db.models import Q
from pure_pagination import Paginator, PageNotAnInteger
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse

from .models import Preview, Movie, Comment, MovieCol
from users.forms import CommentForm


class AnimationView(View):
    """
    轮播图
    """
    def get(self, request):
        previews = Preview.objects.all()
        return render(request, 'animation.html', {"previews": previews})


class SearchView(View):
    """
    搜索
    """
    def get(self, request):
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            movies = Movie.objects.filter(Q(title__icontains=search_keywords) | Q(info__icontains=search_keywords))
            counts = movies.count()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(movies, 8, request=request)
        movies = p.page(page)

        return render(request, 'search.html', {"movies": movies, "search_keywords": search_keywords, "counts": counts})


class MovieDetailView(View):
    """
    电影详情
    """
    def get(self, request, movie_id):
        movie = Movie.objects.get(id=movie_id)
        movie.play_nums += 1
        movie.save()
        comments = Comment.objects.filter(movie_id=movie_id).order_by('-add_time')
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(comments, 8, request=request)
        comments = p.page(page)

        return render(request, 'play.html', {"movie": movie, "comments": comments})


class CommentView(View):
    """
    评论
    """
    def post(self, request):
        if not request.user.is_authenticated():
            return render(request, 'login.html')
        add_form = CommentForm(request.POST)
        if add_form.is_valid():
            content = request.POST.get("content", "")
            movie_id = request.POST.get("movie_id", "")
            comment = Comment(user=request.user, content=content, movie_id=movie_id)
            comment.save()
            movie = Movie.objects.get(id=movie_id)
            movie.comment_nums += 1
            movie.save()
            return HttpResponseRedirect(reverse("detail", args=(movie_id,)))
        else:
            return HttpResponse('重新评论')


class FavMovieView(View):
    """
    收藏电影
    """
    def post(self, request):
        if not request.user.is_authenticated():
            return render(request, 'login.html')

        movie_id = request.POST.get("movie_id", "")
        fav_movie = MovieCol(user=request.user, movie_id=movie_id)
        fav_movie.save()
        return HttpResponseRedirect(reverse("detail", args=(movie_id,)), {"fav_movie": fav_movie})


def page_not_found(request):
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response

