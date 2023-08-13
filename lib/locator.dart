import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/usecase/get_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/remote_article/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton(NewsApiService(getIt()));
  getIt.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(getIt()));
  getIt.registerSingleton<getArticleUseCase>(getArticleUseCase(getIt()));
  getIt.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(getIt()));
}
