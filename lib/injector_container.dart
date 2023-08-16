
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/detailpage/datalayers/repositories/movie_detail_repository_impl.dart';
import 'package:movie_app/features/detailpage/domain/repositories/movie_details_repositories.dart';
import 'package:movie_app/features/detailpage/domain/usecases/get_detail_movie_usecase.dart';
import 'package:movie_app/features/detailpage/presentation/bloc/movie_detail/remote/remote_movie_detail_bloc.dart';
import 'package:movie_app/features/homepage/datalayers/data_sources/remote/movie_api_service.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/features/homepage/datalayers/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/homepage/domain/repositories/movie_repositories.dart';
import 'package:movie_app/features/homepage/domain/usecases/get_latest_movie_usecase.dart';
import 'package:movie_app/features/homepage/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/features/homepage/domain/usecases/get_toprating_movie_usecase.dart';
import 'package:movie_app/features/homepage/domain/usecases/get_upcoming_movie_usecase.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_bloc.dart';
final sl = GetIt.instance;

Future<void> initializedDependency() async {
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<MovieApiService>(MovieApiService(sl()));
  sl.registerSingleton<MovieRepositories>(
    MovieRepositoryImpl(sl())
  );
  sl.registerSingleton<MovieDetailRepositories>(
    MovieDetailRepositoryImpl(sl())
  );

//  Usecase
  sl.registerSingleton<GetLatestMovieUseCase>(
       GetLatestMovieUseCase(sl())
  ); sl.registerSingleton<GetPopularMovieUseCase>(
      GetPopularMovieUseCase(sl())
  ); sl.registerSingleton<GetTopRatedMovieUseCase>(
      GetTopRatedMovieUseCase(sl())
  ); sl.registerSingleton<GetUpcomingMovieUseCase>(
      GetUpcomingMovieUseCase(sl())
  ); sl.registerSingleton<GetDetailMovieUseCase>(
      GetDetailMovieUseCase(sl(),sl())
  );

//  Bloc

  // Sl.registerFactory(() => MovieBloc(Sl(), Sl(), Sl(), Sl(), Sl(), Sl()));
  // Sl.registerFactory(
  //         () => MovieDetailsBloc(Sl(), Sl(), Sl(), Sl(), Sl(), Sl()));
  sl.registerFactory<RemoteMovieBloc>(
      () =>  RemoteMovieBloc(sl(),sl(),sl(),sl(),)
  );
  sl.registerFactory<RemoteMovieDetailBloc>(
      () =>  RemoteMovieDetailBloc(sl(),)
  );
}