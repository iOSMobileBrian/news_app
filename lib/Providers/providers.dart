import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';

import '../Model/news_article.dart';

final newsArticleProvider =
    AsyncNotifierProvider<NewsArticleListView, List<NewsArticle>>(NewsArticleListView.new);
