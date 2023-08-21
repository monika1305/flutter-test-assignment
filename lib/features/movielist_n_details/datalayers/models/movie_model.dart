
import 'package:movie_app/features/movielist_n_details/domain/entities/movie_entities.dart';

class MovieModel extends MovieEntities {
  MovieModel(
      {required String BackdropPath,
        required String PosterPath,
        required int id,
        required String originalTitle,
        required String Overview,
        required double Popularity,
        required String ReleaseDate,
        required String Title,
        required bool Video,
        required double VoteAverage,
        required int VoteCount,
        required String TrailerId,
        required bool isFav})
      : super(
      BackdropPath: BackdropPath,
      PosterPath: PosterPath,
      id: id,
      originalTitle: originalTitle,
      Overview: Overview,
      Popularity: Popularity,
      ReleaseDate: ReleaseDate,
      Title: Title,
      Video: Video,
      VoteAverage: VoteAverage,
      VoteCount: VoteCount,
      TrailerId: TrailerId,
      isFav: isFav);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    BackdropPath:
    json['backdrop_path'] != null ? json['backdrop_path'] : '',
    PosterPath: json['poster_path'] != null ? json['poster_path'] : '',
    id: json['id'],
    originalTitle: json['original_title'],
    Overview: json['overview'],
    Popularity: json['popularity'].toDouble(),
    ReleaseDate: json['release_date'] != null ? json['release_date'] : '',
    Title: json['title'],
    Video: json['video'],
    VoteAverage: json['vote_average'].toDouble(),
    VoteCount: json['vote_count'],
    TrailerId: '',
    isFav: true,
  );
}