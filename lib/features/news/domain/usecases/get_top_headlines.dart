import 'package:news_app_real/features/news/domain/entities/entities.dart';
import 'package:news_app_real/features/news/domain/repositories/news_repository.dart';

class GetTopHeadlines {
  final NewsRepository repository;

  GetTopHeadlines(this.repository);

  Future<List<News>> execute() {
    return repository.getTopHeadlines();
  }
}
