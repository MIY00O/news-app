import 'package:news_app_real/features/news/data/datasources/news_remote_data_source.dart';
import 'package:news_app_real/features/news/domain/entities/entities.dart';
import 'package:news_app_real/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<News>> getTopHeadlines() async {
    return await remoteDataSource.getTopHeadlines();
  }
}
