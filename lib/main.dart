import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_real/features/news/data/datasources/news_remote_data_source.dart';
import 'package:news_app_real/features/news/data/repositories/news_repository_impl.dart';
import 'package:news_app_real/features/news/domain/usecases/get_top_headlines.dart';
import 'package:news_app_real/features/news/presentation/cubit/news_cubit.dart';
import 'package:news_app_real/features/news/presentation/pages/news_page.dart';

void main() {
  final client = http.Client();

  // Inisialisasi data source dan repository
  final dataSource = NewsRemoteDataSource(client);
  final repository = NewsRepositoryImpl(dataSource);
  final getTopHeadlines = GetTopHeadlines(repository);

  runApp(MyApp(getTopHeadlines: getTopHeadlines));
}

class MyApp extends StatelessWidget {
  final GetTopHeadlines getTopHeadlines;

  const MyApp({super.key, required this.getTopHeadlines});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => NewsCubit(getTopHeadlines)..fetchTopHeadLines(),
        child: const NewsPage(),
      ),
    );
  }
}
