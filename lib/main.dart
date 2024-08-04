import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Screens/NewsListPage.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: NewsListPage(),
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
