import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Providers/providers.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';
import 'package:news_app/Widgets/SearchField.dart';
import 'package:news_app/Widgets/NewsList.dart';

class NewsListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsProvider = ref.watch(newsArticleProvider);
    return Scaffold(
      appBar: AppBar(
        title: SearchField(
          onSubmit: (value) {
            if (value.isNotEmpty) {
              ref.read(newsArticleProvider.notifier).newsSearch(value);
            }
          },
        ),
      ),
      body: newsProvider.when(
        data: (List<NewsArticleViewModel> data) => NewsList(articles: data),
        error: (Object error, _) {
          print(error);
          return null;
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
