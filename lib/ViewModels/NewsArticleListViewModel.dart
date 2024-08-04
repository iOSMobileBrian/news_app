import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Model/news_article.dart';
import 'package:news_app/Services/WebService.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';

enum LoadingStatus { completed, loading, searching, empty }

class NewsArticleListView extends AsyncNotifier<List<NewsArticleViewModel>> {
  var loadingStatus = LoadingStatus.searching;

  Future<void> newsSearch(String keyword) async {
    state = const AsyncLoading();

    List<NewsArticle> results = await WebService().getNewsByKeyword(keyword);

    final articles = results.map((results) => NewsArticleViewModel(article: results)).toList();
    state = AsyncData(articles);
  }

  Future<List<NewsArticleViewModel>> _createNewsList() async {
    state = const AsyncLoading();
    List<NewsArticle> newsArticle = await WebService().getNews();

    final articles = newsArticle.map((articles) => NewsArticleViewModel(article: articles)).toList();
    return articles;
  }

  @override
  FutureOr<List<NewsArticleViewModel>> build() async {
    return await _createNewsList();
  }
}
