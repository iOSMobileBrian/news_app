



import 'package:flutter/cupertino.dart';
import 'package:news_app/Model/news_article.dart';
import 'package:news_app/Services/WebService.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';

enum LoadingStatus{

  completed,
  loading,
  searching,
  empty
}


class NewsArticleListView extends ChangeNotifier{

  List<NewsArticleViewModel> articles = [];

  NewsArticleListView(){
    _createNewsList();
  }

  var loadingStatus = LoadingStatus.searching;


  Future<void> newsSearch(String keyword) async{
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> results = await WebService().getNewsByKeyword(keyword);

    this.articles = results.map((results) => NewsArticleViewModel(article: results)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();

  }

  Future<void> _createNewsList() async{

    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticle = await WebService().getNews();

    this.articles = newsArticle.map((articles) => NewsArticleViewModel(article: articles)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}