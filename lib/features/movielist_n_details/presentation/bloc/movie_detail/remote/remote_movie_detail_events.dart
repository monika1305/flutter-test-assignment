
import 'package:equatable/equatable.dart';

import 'package:dio/dio.dart';

abstract class RemoteMovieDetailEvents extends Equatable {


  @override
  List<Object?> get props => [];

}

class GetDetailMovieEvent extends RemoteMovieDetailEvents{
  final int id;

  GetDetailMovieEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetDetailMovieVideoEvent extends RemoteMovieDetailEvents {
  final int id;
  GetDetailMovieVideoEvent(this.id);
  @override
  List<Object> get props => [id];
}