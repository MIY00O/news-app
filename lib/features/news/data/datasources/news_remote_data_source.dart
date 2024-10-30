import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_real/features/news/data/models/news_model.dart';

class NewsRemoteDataSource {
  final http.Client client;
  final String apiKey = '97ea719de5d1491190d7a34f53545a3d';
  NewsRemoteDataSource(this.client);

  Future<List<NewsModel>> getTopHeadlines() async {
    final response = await client.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey'),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception('failed to load news');
    }
  }
}
