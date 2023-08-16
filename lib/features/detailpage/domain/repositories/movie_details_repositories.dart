
import 'package:movie_app/features/homepage/domain/entities/movie_entities.dart';

import '../../../../core/resources/data_state.dart';

abstract class MovieDetailRepositories{

  Future<DataState<MovieEntities>> getDetailsMovies(int id);

}