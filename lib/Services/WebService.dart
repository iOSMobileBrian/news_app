
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_article.dart';
import 'package:news_app/Utilities/constants.dart';

class WebService {

  Future<List<NewsArticle>> getNews() async {

    final response = await http.get(Constants.kGetNewsUrl);

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


    final response = await http.get(Constants.kFetchByKeyword(keyword));

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
