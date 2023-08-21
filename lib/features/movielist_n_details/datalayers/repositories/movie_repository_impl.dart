
import 'dart:io';

import 'package:movie_app/config/constant/constant.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/movielist_n_details/datalayers/data_sources/remote/movie_api_service.dart';
import 'package:movie_app/features/movielist_n_details/datalayers/models/movie_model.dart';
import 'package:movie_app/features/movielist_n_details/domain/entities/movie_entities.dart';
import 'package:movie_app/features/movielist_n_details/domain/repositories/movie_repositories.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl implements MovieRepositories{

  final MovieApiService _movieApiService;

  MovieRepositoryImpl(this._movieApiService);



  @override
  Future<DataState<List<MovieModel>>> getLatestMovies() async {

    try{
      final httpResponse = await _movieApiService.getLatestMovies(
        api_key: api_key,
        language: language,
        accept: accept,
      );
      // print('httpResponse response ${httpResponse.response.toString()}');
      print('httpResponse response statusCode ${httpResponse.response.statusCode}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions)
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getPopularMovies() async {
    try{
      final httpResponse = await _movieApiService.getPopularMovies(
        api_key: api_key,
        language: language,
        accept: accept,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions)
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getTopRatedMovies() async {
    try{
      final httpResponse = await _movieApiService.getTopRatedMovies(
        api_key: api_key,
        language: language,
        accept: accept,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions)
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getUpComingMovies() async {
    try{
      final httpResponse = await _movieApiService.getUpComingMovies(
        api_key: api_key,
        language: language,
        accept: accept,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions)
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }


  @override
  Future<DataState<MovieModel>> getDetailsMovies(int id) async {
    try{
      // print(' getDetailsMovies impl ${ ConstantValueApiGet.DetailsMovie(id) }');

      final httpResponse = await _movieApiService.getDetailMovieById(
          ConstantValueApiGet.DetailsMovie(id)
      );
      // print(' getDetailsMovies httpResponse ${ httpResponse.response.toString()}');
      print(' getDetailsMovies statusCode ${ httpResponse.response.statusCode}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data as MovieModel);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions)
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }




  @override
  Future<DataState<MovieModel>> getDetailsMovieVideo(int id) async {
    try{
      // print(' getDetailsMovieVideo impl ${ ConstantValueApiGet.DetailsMovie(id) }');

      final httpResponse = await _movieApiService.getDetailMovieById(
          ConstantValueApiGet.VideoMovie(id)
      );
      // print(' getDetailsMovieVideo httpResponse ${ httpResponse.response.toString()}');
      print(' getDetailsMovieVideo statusCode ${ httpResponse.response.statusCode}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data as MovieModel);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions)
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }
}