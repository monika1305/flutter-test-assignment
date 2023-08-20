
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_entities.dart';
import 'package:dio/dio.dart';
// @immutable
// abstract class RemoteMovieState extends Equatable{
//   const RemoteMovieState();
//   //
//   // final List<MovieEntities> ? movies;
//   // final DioException ? error;
//   //
//   // const RemoteMovieState({this.movies, this.error});
//   // @override
//   // List<Object> get props => [movies!, error!];
// }
//
// class RemoteMovieStateLoading extends RemoteMovieState{
//   const RemoteMovieStateLoading();
//   List<Object> get props => [];
// }
//
// class RemoteMovieStateDone extends RemoteMovieState{
//
//   final List<MovieEntities> movies;
//
//    RemoteMovieStateDone(this.movies);
//    List<Object> get props =>[movies];
// }
//
// class RemoteMovieStateError extends RemoteMovieState{
//
//   final DioException  error;
//   const RemoteMovieStateError(this.error);
//   List<Object> get props => [error];
// }
enum EnumRequest {
  loding,
  loded,
  error,
}

class RemoteMovieState extends Equatable {
  final List<MovieEntities> popularData;
  final EnumRequest enumRequestPopular;
  final String messagePopular;


  final List<MovieEntities> topratedData;
  final EnumRequest enumRequesttoprated;
  final String messagetoprated;

  final List<MovieEntities> upcomingData;
  final EnumRequest enumRequestupcoming;
  final String messageupcoming;

  final List<MovieEntities> latestData;
  final EnumRequest enumRequestlatest;
  final String messagelatest;

  RemoteMovieState({
    this.popularData = const [],
    this.enumRequestPopular = EnumRequest.loding,
    this.messagePopular = '',
    this.topratedData = const [],
    this.enumRequesttoprated = EnumRequest.loding,
    this.messagetoprated = '',
    this.upcomingData = const [],
    this.enumRequestupcoming = EnumRequest.loding,
    this.messageupcoming = '',
    this.latestData = const [],
    this.enumRequestlatest = EnumRequest.loding,
    this.messagelatest = '',
  });

  RemoteMovieState copyWith({
    final List<MovieEntities>? popularData,
    final EnumRequest? enumRequestPopular,
    final String? messagePopular,
    final List<MovieEntities>? topratedData,
    final EnumRequest? enumRequesttoprated,
    final String? messagetoprated,
    final List<MovieEntities>? upcomingData,
    final EnumRequest? enumRequestupcoming,
    final String? messageupcoming,
    final List<MovieEntities>? latestData,
    final EnumRequest? enumRequestlatest,
    final String? messagelatest,
  }) {
    return RemoteMovieState(
      popularData: popularData ?? this.popularData,
      enumRequestPopular: enumRequestPopular ?? this.enumRequestPopular,
      messagePopular: messagePopular ?? this.messagePopular,
      topratedData: topratedData ?? this.topratedData,
      enumRequesttoprated: enumRequesttoprated ?? this.enumRequesttoprated,
      messagetoprated: messagetoprated ?? this.messagetoprated,
      upcomingData: upcomingData ?? this.upcomingData,
      enumRequestupcoming: enumRequestupcoming ?? this.enumRequestupcoming,
      messageupcoming: messageupcoming ?? this.messageupcoming,
      latestData: latestData ?? this.latestData,
      enumRequestlatest: enumRequestlatest ?? this.enumRequestlatest,
      messagelatest: messagelatest ?? this.messagelatest,
    );
  }

  @override
  List<Object?> get props => [
    popularData,
    enumRequestPopular,
    messagePopular,
    topratedData,
    enumRequesttoprated,
    messagetoprated,
    upcomingData,
    enumRequestupcoming,
    messageupcoming,
    latestData,
    enumRequestlatest,
    messagelatest,
  ];
}