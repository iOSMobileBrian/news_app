


import 'package:news_app/Model/news_article.dart';

class NewsArticleViewModel {

  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}): _newsArticle = article;

  String get title {

    return _newsArticle.title;
  }

  String get description {

    return _newsArticle.description;
  }

  String get url {

    return _newsArticle.url;
  }

  String get imageUrl{

    return _newsArticle.urlToImage;
  }

}