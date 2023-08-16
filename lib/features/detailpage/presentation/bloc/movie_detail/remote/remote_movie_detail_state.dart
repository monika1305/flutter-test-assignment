
import 'package:equatable/equatable.dart';

import '../../../../../homepage/domain/entities/movie_entities.dart';
import 'package:dio/dio.dart';
abstract class RemoteMovieDetailState extends Equatable{

  final MovieEntities ? movies;
  final DioException ? error;

  const RemoteMovieDetailState({this.movies, this.error});
  @override
  List<Object> get props => [movies!, error!];
}

class RemoteMovieDetailStateLoading extends RemoteMovieDetailState{
  const RemoteMovieDetailStateLoading();
}

class RemoteMovieDetailStateDone extends RemoteMovieDetailState{
  const RemoteMovieDetailStateDone(MovieEntities movies):super(movies: movies,);
}

class RemoteMovieDetailStateError extends RemoteMovieDetailState{
  const RemoteMovieDetailStateError(DioException error): super(error: error);
}