import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_real/features/news/domain/entities/entities.dart';
import 'package:news_app_real/features/news/presentation/cubit/news_cubit.dart';
import 'package:news_app_real/features/news/presentation/widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Headlines')),
      body: BlocBuilder<NewsCubit, List<News>>(
        builder: (context, newsList) {
          if (newsList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => NewsCard(
              news: newsList[index],
            ),
          );
        },
      ),
    );
  }
}
