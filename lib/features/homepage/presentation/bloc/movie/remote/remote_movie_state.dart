
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_entities.dart';
import 'package:dio/dio.dart';
abstract class RemoteMovieState extends Equatable{

  final List<MovieEntities> ? movies;
  final DioException ? error;

  const RemoteMovieState({this.movies, this.error});
  @override
  List<Object> get props => [movies!, error!];
}

class RemoteMovieStateLoading extends RemoteMovieState{
  const RemoteMovieStateLoading();
}

class RemoteMovieStateDone extends RemoteMovieState{
  const RemoteMovieStateDone(List<MovieEntities> movies):super(movies: movies,);
}

class RemoteMovieStateError extends RemoteMovieState{
  const RemoteMovieStateError(DioException error): super(error: error);
}