import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';

final newsArticleProvider =
    AsyncNotifierProvider<NewsArticleListView, List<NewsArticleViewModel>>(NewsArticleListView.new);
