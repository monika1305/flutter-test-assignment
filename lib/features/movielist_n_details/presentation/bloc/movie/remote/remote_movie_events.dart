
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_entities.dart';
import 'package:dio/dio.dart';

abstract class RemoteMovieEvents {

  const RemoteMovieEvents();

}

class GetPopularEvent extends RemoteMovieEvents{
  const GetPopularEvent();
}
class GetLatestEvent extends RemoteMovieEvents{
  const GetLatestEvent();
}
class GetUpCommingEvent extends RemoteMovieEvents{
  const GetUpCommingEvent();
}
class GetTopRatingEvent extends RemoteMovieEvents{
  const GetTopRatingEvent();
}
