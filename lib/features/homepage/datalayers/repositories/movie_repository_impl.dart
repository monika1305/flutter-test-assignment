
import 'dart:io';

import 'package:movie_app/config/constant/constant.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/homepage/datalayers/data_sources/remote/movie_api_service.dart';
import 'package:movie_app/features/homepage/datalayers/models/movie_model.dart';
import 'package:movie_app/features/homepage/domain/repositories/movie_repositories.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl implements MovieRepositories{

  final MovieApiService _movieApiService;

  MovieRepositoryImpl(this._movieApiService);



  @override
  Future<DataState<MovieModel>> getDetailsMovies(int id) async {
    try{
      final httpResponse = await _movieApiService.getDetailMovieById(
        language: language,
        id: id,
        accept: accept,
        authorization: authorization,
      );

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
  Future<DataState<List<MovieModel>>> getPopularMovies() async {
    try{
      final httpResponse = await _movieApiService.getPopularMovies(
        language: language,
        accept: accept,
        authorization: authorization,
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
        language: language,
        accept: accept,
        authorization: authorization,
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
  Future<DataState<List<MovieModel>>> getLatestMovies() async {

  try{
    final httpResponse = await _movieApiService.getLatestMovies(
      language: language,
      accept: accept,
      authorization: authorization,
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
        language: language,
        accept: accept,
        authorization: authorization,
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

}