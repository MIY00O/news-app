import 'package:flutter/material.dart';
import 'package:news_app_real/features/news/domain/entities/entities.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          news.urlToImage.isNotEmpty
              ? Image.network(news.urlToImage)
              : const SizedBox.shrink(),
          ListTile(
            title: Text(news.title),
            subtitle: Text(news.description),
            onTap: () => _openArticle(context, news.url),
          ),
        ],
      ),
    );
  }

  void _openArticle(BuildContext context, String url) {
    //
  }
}
