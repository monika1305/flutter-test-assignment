
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/movielist_n_details/domain/entities/movie_entities.dart';
import 'package:movie_app/features/movielist_n_details/domain/repositories/movie_repositories.dart';


class GetLatestMovieUseCase implements UseCase<DataState<List<MovieEntities>>, void>{

  late final MovieRepositories _movieRepositories;
   GetLatestMovieUseCase(this._movieRepositories);

  @override
  Future<DataState<List<MovieEntities>>> call({void params}) {
  return _movieRepositories.getLatestMovies();
  }

}