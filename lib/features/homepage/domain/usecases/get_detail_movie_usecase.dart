
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/homepage/domain/entities/movie_entities.dart';
import 'package:movie_app/features/homepage/domain/repositories/movie_repositories.dart';


class GetDetailMovieUseCase implements UseCase<DataState<MovieEntities>, void>{

   final MovieRepositories _movieRepositories;
   final int id;
   GetDetailMovieUseCase(this._movieRepositories, this.id);

  @override
  Future<DataState<MovieEntities>> call({void params}) {
  return _movieRepositories.getDetailsMovies(id);
  }

}