


import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';



class NewsArticleDetails extends StatelessWidget {

  final NewsArticleViewModel article;

  NewsArticleDetails({this.article});

  @override
  Widget build(BuildContext context) {

    print("article: $article");

    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
        
      ),
      body: WebView(
        initialUrl: '${this.article.url}',
      ),
    );
  }
}
