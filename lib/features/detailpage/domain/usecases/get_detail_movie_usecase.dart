
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/detailpage/domain/repositories/movie_details_repositories.dart';
import 'package:movie_app/features/homepage/domain/entities/movie_entities.dart';
import 'package:movie_app/features/homepage/domain/repositories/movie_repositories.dart';


class GetDetailMovieUseCase implements UseCase<DataState<MovieEntities>, void>{

   final MovieDetailRepositories _detailRepositories;
   final int id;
   GetDetailMovieUseCase(this._detailRepositories, this.id);

  @override
  Future<DataState<MovieEntities>> call({void params}) {
  return _detailRepositories.getDetailsMovies(id);
  }

}