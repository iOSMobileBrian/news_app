
import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:news_app/Screens/NewsArticleDetails.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';

class NewsList extends StatelessWidget {

  NewsList({this.vm});

  final NewsArticleListView vm;


  void _showDetails(BuildContext context, NewsArticleViewModel article){

    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsArticleDetails(article:article )));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (context, index){

          final article = vm.articles[index];
          return ListTile(
            onTap: (){
             _showDetails(context, article);
            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imageUrl == null? Image.asset("images/news-placeholder.png"):Image.network(article.imageUrl)),
            title: Text(article.title),


          );
        });
  }
}