import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class NewsArticleDetails extends StatefulWidget {
  final NewsArticleViewModel article;

  NewsArticleDetails({required this.article});

  @override
  State<NewsArticleDetails> createState() => _NewsArticleDetailsState();
}

class _NewsArticleDetailsState extends State<NewsArticleDetails> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.article.url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    print("article: ${widget.article}");

    return Scaffold(
      appBar: AppBar(
        title: Text("${this.widget.article.title}"),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
