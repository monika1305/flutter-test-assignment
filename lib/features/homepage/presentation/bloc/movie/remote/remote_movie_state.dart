
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_entities.dart';
import 'package:dio/dio.dart';
@immutable
abstract class RemoteMovieState extends Equatable{
  const RemoteMovieState();
  //
  // final List<MovieEntities> ? movies;
  // final DioException ? error;
  //
  // const RemoteMovieState({this.movies, this.error});
  // @override
  // List<Object> get props => [movies!, error!];
}

class RemoteMovieStateLoading extends RemoteMovieState{
  const RemoteMovieStateLoading();
  List<Object> get props => [];
}

class RemoteMovieStateDone extends RemoteMovieState{

  final List<MovieEntities> movies;

   RemoteMovieStateDone(this.movies);
   List<Object> get props =>[movies];
}

class RemoteMovieStateError extends RemoteMovieState{

  final DioException  error;
  const RemoteMovieStateError(this.error);
  List<Object> get props => [error];
}