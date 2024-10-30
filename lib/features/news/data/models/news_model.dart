import 'package:news_app_real/features/news/domain/entities/entities.dart';

class NewsModel extends News {
  NewsModel({
    required String title,
    required String description,
    required String urlToImage,
    required String url,
  }) : super(
            title: title,
            description: description,
            urlToImage: urlToImage,
            url: url);
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        url: json['url']);
  }
}
