import 'package:equatable/equatable.dart';

class MovieEntities extends Equatable {
  final String BackdropPath;
  final String PosterPath;
  final int id;
  final String originalTitle;
  final String Overview;
  final double Popularity;
  final String ReleaseDate;
  final String Title;
  final bool Video;
  final double VoteAverage;
  final int VoteCount;
  //final List<dynamic> GenreIds ;
  late final String TrailerId;
  late final bool isFav;

  MovieEntities(
      {required this.BackdropPath,
        required this.PosterPath,
        required this.id,
        required this.originalTitle,
        required this.Overview,
        required this.Popularity,
        required this.ReleaseDate,
        required this.Title,
        required this.Video,
        required this.VoteAverage,
        required this.VoteCount,
        required this.TrailerId,
        required this.isFav});

  @override
  List<Object?> get props => [
    BackdropPath,
    PosterPath,
    id,
    originalTitle,
    Overview,
    Popularity,
    ReleaseDate,
    Title,
    Video,
    VoteAverage,
    VoteCount,
    isFav
  ];
}
