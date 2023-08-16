
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/homepage/domain/entities/movie_entities.dart';
import 'package:movie_app/features/homepage/domain/repositories/movie_repositories.dart';


class GetPopularMovieUseCase implements UseCase<DataState<List<MovieEntities>>, void>{

   final MovieRepositories _movieRepositories;
   GetPopularMovieUseCase(this._movieRepositories);

  @override
  Future<DataState<List<MovieEntities>>> call({void params}) {
    return _movieRepositories.getPopularMovies();
  }
}