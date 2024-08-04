import 'package:flutter/material.dart';
import 'package:news_app/Screens/NewsArticleDetails.dart';

import '../Model/news_article.dart';

class NewsList extends StatelessWidget {
  NewsList({required this.articles});

  final List<NewsArticle> articles;

  void _showDetails(BuildContext context, NewsArticle article) {
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
                child: article.urlToImage.isEmpty
                    ? Image.asset("images/news-placeholder.png")
                    : Image(image: NetworkImage(article.urlToImage),fit: BoxFit.cover,)),
            title: Text(article.title),
          );
        });
  }
}
