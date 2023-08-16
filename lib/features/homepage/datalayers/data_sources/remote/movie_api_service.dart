import 'package:movie_app/features/homepage/datalayers/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../config/constant/constant.dart';
import 'package:dio/dio.dart';
part 'movie_api_service.g.dart';

@RestApi(baseUrl: movieApiBaseUrl)
abstract class MovieApiService {

  factory MovieApiService(Dio _dio) = _MovieApiService;

  // GET /3/movie/now_playing?language=en-US&page=1 HTTP/1.1
  // Accept: application/json
  // Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODBiMzVjNzljOWFlZWNjODhkMDJkYjhjNzQzN2Y5ZSIsInN1YiI6IjVhOTZjYjhiOTI1MTQxN2IwOTAwYmY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sd4tLKX0VYKsmMBnkGdled_0c-KuPrqibgMwvyz1ndY
  // Host: api.themoviedb.org
  @GET('/now_playing')
  Future<HttpResponse<List<MovieModel>>> getLatestMovies({
    @Query("language") String ? language,
    @Query("Accept") String ? accept,
    @Query("Authorization") String ? authorization,
  });

  // GET /3/tv/popular?language=en-US&page=1 HTTP/1.1
  // Accept: application/json
  // Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODBiMzVjNzljOWFlZWNjODhkMDJkYjhjNzQzN2Y5ZSIsInN1YiI6IjVhOTZjYjhiOTI1MTQxN2IwOTAwYmY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sd4tLKX0VYKsmMBnkGdled_0c-KuPrqibgMwvyz1ndY
  // Host: api.themoviedb.org
  @GET('/popular')
  Future<HttpResponse<List<MovieModel>>> getPopularMovies({
    @Query("language") String ? language,
    @Query("Accept") String ? accept,
    @Query("Authorization") String ? authorization,
  });

  // GET /3/tv/top_rated?language=en-US&page=1 HTTP/1.1
  // Accept: application/json
  // Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODBiMzVjNzljOWFlZWNjODhkMDJkYjhjNzQzN2Y5ZSIsInN1YiI6IjVhOTZjYjhiOTI1MTQxN2IwOTAwYmY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sd4tLKX0VYKsmMBnkGdled_0c-KuPrqibgMwvyz1ndY
  // Host: api.themoviedb.org
  @GET('/top_rated')
  Future<HttpResponse<List<MovieModel>>> getTopRatedMovies({
    @Query("language") String ? language,
    @Query("Accept") String ? accept,
    @Query("Authorization") String ? authorization,
  });

  // GET /3/movie/upcoming?language=en-US&page=1 HTTP/1.1
  // Accept: application/json
  // Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODBiMzVjNzljOWFlZWNjODhkMDJkYjhjNzQzN2Y5ZSIsInN1YiI6IjVhOTZjYjhiOTI1MTQxN2IwOTAwYmY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sd4tLKX0VYKsmMBnkGdled_0c-KuPrqibgMwvyz1ndY
  // Host: api.themoviedb.org
  @GET('/upcoming')
  Future<HttpResponse<List<MovieModel>>> getUpComingMovies({
    @Query("language") String ? language,
    @Query("Accept") String ? accept,
    @Query("Authorization") String ? authorization,
  });

  // GET /3/movie/movie_id?language=en-US HTTP/1.1
  // Accept: application/json
  // Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODBiMzVjNzljOWFlZWNjODhkMDJkYjhjNzQzN2Y5ZSIsInN1YiI6IjVhOTZjYjhiOTI1MTQxN2IwOTAwYmY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sd4tLKX0VYKsmMBnkGdled_0c-KuPrqibgMwvyz1ndY
  // Host: api.themoviedb.org

  @GET('/movie_id')
  Future<HttpResponse<List<MovieModel>>> getDetailMovieById({
    @Query("language") String ? language,
    @Query("movie_id") int ? id,
    @Query("Accept") String ? accept,
    @Query("Authorization") String ? authorization,
  });

}