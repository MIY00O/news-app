import 'package:news_app_real/features/news/domain/entities/entities.dart';
import 'package:news_app_real/features/news/domain/usecases/get_top_headlines.dart';
import 'package:bloc/bloc.dart';

class NewsCubit extends Cubit<List<News>> {
  final GetTopHeadlines getTopHeadlines;

  NewsCubit(this.getTopHeadlines) : super([]);

  Future<void> fetchTopHeadLines() async {
    try {
      final newsList = await getTopHeadlines.execute();
      emit(newsList);
    } catch (_) {
      emit([]);
    }
  }
}
