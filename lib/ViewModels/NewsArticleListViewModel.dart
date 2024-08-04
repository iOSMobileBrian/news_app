import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Model/news_article.dart';
import 'package:news_app/Services/WebService.dart';



class NewsArticleListView extends AsyncNotifier<List<NewsArticle>> {

  Future<void> newsSearch(String keyword) async {
    state = const AsyncLoading();
    List<NewsArticle> results = await WebService().getNewsByKeyword(keyword);
    state = AsyncValue<List<NewsArticle>>.data(results);
  }

  Future<List<NewsArticle>> _createNewsList() async {
    state = const AsyncLoading();
    List<NewsArticle> newsArticle = await WebService().getNews();
    return newsArticle;
  }

  @override
  Future<List<NewsArticle>> build() async {
    final results = await _createNewsList();
    return results;
  }
}
