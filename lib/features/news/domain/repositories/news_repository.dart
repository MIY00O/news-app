import 'package:news_app_real/features/news/domain/entities/entities.dart';

abstract class NewsRepository {
  Future<List<News>> getTopHeadlines();
}
