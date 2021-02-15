import 'package:flutter/material.dart';
import 'package:news_app/Screens/NewsListPage.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
            create: (context) => NewsArticleListView(),
            child: NewsListPage(),),
      title: 'News App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

    );
  }
}


