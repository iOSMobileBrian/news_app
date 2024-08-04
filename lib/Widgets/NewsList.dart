import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:news_app/Screens/NewsArticleDetails.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  NewsList({required this.articles});

  final List<NewsArticleViewModel> articles;

  void _showDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsArticleDetails(article: article)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          print(article);
          return ListTile(
            onTap: () {
              _showDetails(context, article);
            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imageUrl.isEmpty
                    ? Image.asset("images/news-placeholder.png")
                    : Image.network(article.imageUrl)),
            title: Text(article.title),
          );
        });
  }
}
