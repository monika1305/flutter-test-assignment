
import 'package:equatable/equatable.dart';

import 'package:dio/dio.dart';

abstract class RemoteMovieDetailEvents {

  const RemoteMovieDetailEvents();

}

class GetDetailMovieEvent extends RemoteMovieDetailEvents{
  const GetDetailMovieEvent();
}