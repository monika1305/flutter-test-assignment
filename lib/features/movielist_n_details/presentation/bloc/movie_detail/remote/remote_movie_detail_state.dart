
import 'package:equatable/equatable.dart';

import '../../../../../movielist_n_details/domain/entities/movie_entities.dart';
import 'package:dio/dio.dart';
enum EnumRequest {
  loding,
  loded,
  error,
}
class RemoteMovieDetailState extends Equatable{
  final MovieEntities? detailsData;
  final EnumRequest enumRequestdetails;
  final String messagedetails;

  final String? video;
  final EnumRequest enumRequestvideo;
  final String messagevideo;

  const RemoteMovieDetailState({
    this.detailsData,
    this.enumRequestdetails = EnumRequest.loding,
    this.messagedetails = '',
    this.video,
    this.enumRequestvideo = EnumRequest.loding,
    this.messagevideo = '',
  });
  RemoteMovieDetailState copyWith({
  final MovieEntities? detailsData,
  final EnumRequest? enumRequestdetails,
  final String? messagedetails,

  final String? video,
  final EnumRequest? enumRequestvideo,
  final String? messagevideo,

}) {
    return RemoteMovieDetailState(
      detailsData: detailsData ?? this.detailsData,
      enumRequestdetails: enumRequestdetails ?? this.enumRequestdetails,
      messagedetails: messagedetails ?? this.messagedetails,
      video: video ?? this.video,
      enumRequestvideo: enumRequestdetails ?? this.enumRequestvideo,
      messagevideo: messagedetails ?? this.messagevideo,
    );
  }

  @override
  List<Object?> get props => [
  detailsData,
  enumRequestdetails,
  messagedetails,
  video,
  enumRequestvideo,
  messagevideo
  ];

}