import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movielist_n_details/domain/usecases/get_detail_movie_video_usecase.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_bloc.dart';

import '../features/movielist_n_details/datalayers/data_sources/remote/movie_api_service.dart';
import '../features/movielist_n_details/datalayers/repositories/movie_repository_impl.dart';
import '../features/movielist_n_details/domain/repositories/movie_repositories.dart';

import 'package:dio/dio.dart';

import '../features/movielist_n_details/domain/usecases/get_detail_movie_usecase.dart';
import '../features/movielist_n_details/domain/usecases/get_latest_movie_usecase.dart';
import '../features/movielist_n_details/domain/usecases/get_popular_movie_usecase.dart';
import '../features/movielist_n_details/domain/usecases/get_toprating_movie_usecase.dart';
import '../features/movielist_n_details/domain/usecases/get_upcoming_movie_usecase.dart';

final Sl = GetIt.instance;

class ServiceLocator {
  void init() {
    Sl.registerSingleton<Dio>(Dio());

    // Dependencies
    Sl.registerSingleton<MovieApiService>(MovieApiService(Sl()));

    // usecases
    Sl.registerLazySingleton<GetPopularMovieUseCase>(() =>
        GetPopularMovieUseCase(Sl()));
     Sl.registerLazySingleton<GetLatestMovieUseCase>(() =>
        GetLatestMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetTopRatedMovieUseCase>(() =>
        GetTopRatedMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetUpcomingMovieUseCase>(() =>
        GetUpcomingMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetDetailMovieUseCase>(() =>
        GetDetailMovieUseCase(Sl()));
    Sl.registerLazySingleton<GetDetailMovieVideoUseCase>(() =>
        GetDetailMovieVideoUseCase(Sl()));

    // repositories
    Sl.registerLazySingleton<MovieRepositories>(() =>
        MovieRepositoryImpl(Sl()));

    // bloc
    Sl.registerFactory(() => RemoteMovieBloc(Sl(), Sl(), Sl(), Sl()));
    Sl.registerFactory(() => RemoteMovieDetailBloc(Sl(),Sl()));


  }
}
