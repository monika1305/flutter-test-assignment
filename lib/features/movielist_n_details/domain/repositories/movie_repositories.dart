
import 'package:movie_app/features/movielist_n_details/domain/entities/movie_entities.dart';

import '../../../../core/resources/data_state.dart';

abstract class MovieRepositories{

  Future<DataState<List<MovieEntities>>> getPopularMovies();
  Future<DataState<List<MovieEntities>>> getTopRatedMovies();
  Future<DataState<List<MovieEntities>>> getUpComingMovies();
  Future<DataState<List<MovieEntities>>> getLatestMovies();

  Future<DataState<MovieEntities>> getDetailsMovies(int id);
  Future<DataState<MovieEntities>> getDetailsMovieVideo(int parameter);

}