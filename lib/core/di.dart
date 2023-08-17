import 'package:get_it/get_it.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie_detail/remote/remote_movie_detail_bloc.dart';

import '../features/homepage/datalayers/data_sources/remote/movie_api_service.dart';
import '../features/homepage/datalayers/repositories/movie_repository_impl.dart';
import '../features/homepage/domain/repositories/movie_repositories.dart';

import 'package:dio/dio.dart';

import '../features/homepage/domain/usecases/get_detail_movie_usecase.dart';
import '../features/homepage/domain/usecases/get_latest_movie_usecase.dart';
import '../features/homepage/domain/usecases/get_popular_movie_usecase.dart';
import '../features/homepage/domain/usecases/get_toprating_movie_usecase.dart';
import '../features/homepage/domain/usecases/get_upcoming_movie_usecase.dart';

final Sl = GetIt.instance;

class ServiceLocator {
  void init() {
    Sl.registerSingleton<Dio>(Dio());

    // Dependencies
    Sl.registerSingleton<MovieApiService>(MovieApiService(Sl()));

    // usecases
    Sl.registerLazySingleton<GetPopularMovieUseCase>(() =>
        GetPopularMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetDetailMovieUseCase>(() =>
        GetDetailMovieUseCase(Sl(), Sl()));
    Sl.registerLazySingleton<GetLatestMovieUseCase>(() =>
        GetLatestMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetTopRatedMovieUseCase>(() =>
        GetTopRatedMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetUpcomingMovieUseCase>(() =>
        GetUpcomingMovieUseCase(Sl()));

    // repositories
    Sl.registerLazySingleton<MovieRepositories>(() =>
        MovieRepositoryImpl(Sl()));

    // bloc
    Sl.registerFactory(() => RemoteMovieBloc(Sl(), Sl(), Sl(), Sl()));
    Sl.registerFactory(() => RemoteMovieDetailBloc(Sl()));


  }
}
