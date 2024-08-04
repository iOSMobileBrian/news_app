import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_article.dart';

class WebService {
  Future<List<NewsArticle>> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=53eb5237cd3f4daa9e75ea38efe4f08a";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      Iterable list = results["articles"];
      //print("List: $list");
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("an error occurred");
    }
  }

  Future<List<NewsArticle>> getNewsByKeyword(String keyword) async {
    String url = "https://newsapi.org/v2/top-headlines?sources=$keyword&apiKey=53eb5237cd3f4daa9e75ea38efe4f08a";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      Iterable list = results["articles"];
      //print("List: $list");
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("an error occurred");
    }
  }
}
