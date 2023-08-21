
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/movielist_n_details/domain/entities/movie_entities.dart';
import 'package:movie_app/features/movielist_n_details/domain/repositories/movie_repositories.dart';


class GetDetailMovieVideoUseCase implements UseCase<DataState<MovieEntities>, int>{

   final MovieRepositories _movieRepositories;
   GetDetailMovieVideoUseCase(this._movieRepositories);

  @override
  Future<DataState<MovieEntities>> call({int? params}) {
  return _movieRepositories.getDetailsMovies(params!);
  }

}