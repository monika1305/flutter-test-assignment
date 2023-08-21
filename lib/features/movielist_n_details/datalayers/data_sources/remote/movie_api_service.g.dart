// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MovieApiService implements MovieApiService {
  _MovieApiService(
      this._dio, {
        this.baseUrl,
      }) {
    baseUrl ??= 'https://api.themoviedb.org/3/movie';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<MovieModel>>> getLatestMovies({
    String? api_key,
    String? language,
    String? accept,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': api_key,
      r'language': language,
      r'Accept': accept,
    };
    // print('getLatestMovies ${queryParameters.toString()}');
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<MovieModel>>>(Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        )
            .compose(
          _dio.options,
          '/now_playing',
          queryParameters: queryParameters,
          data: _data,
        )
            .copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    // print('getLatestMovies ${_result.data.toString()}');
    // print('getLatestMovies ${_result.data!['results'].toString()}');

    var value = _result.data!['results']
        .map((i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    // print('getLatestMovies value ${value.toString()}');

    /// for casting
    List<MovieModel> latestList = value.cast<MovieModel>();
    print('getLatestMovies value ${latestList.length.toString()}');

    final httpResponse = HttpResponse(latestList, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<MovieModel>>> getPopularMovies({
    String? api_key,
    String? language,
    String? accept,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': api_key,
      r'language': language,
      r'Accept': accept,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<MovieModel>>>(Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        )
            .compose(
          _dio.options,
          '/popular',
          queryParameters: queryParameters,
          data: _data,
        )
            .copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    // print('getPopularMovies ${_result.data.toString()}');
    // print('getPopularMovies ${_result.data!['results'].toString()}');

    var value = _result.data!['results']
        .map((i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    // print('getPopularMovies value ${value.toString()}');

    /// for casting
    List<MovieModel> popularList = value.cast<MovieModel>();
    print('getPopularMovies value ${popularList.length.toString()}');

    final httpResponse = HttpResponse(popularList, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<MovieModel>>> getTopRatedMovies({
    String? api_key,
    String? language,
    String? accept,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': api_key,
      r'language': language,
      r'Accept': accept,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<MovieModel>>>(Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        )
            .compose(
          _dio.options,
          '/top_rated',
          queryParameters: queryParameters,
          data: _data,
        )
            .copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    // print('getTopRatedMovies ${_result.data.toString()}');
    // print('getTopRatedMovies ${_result.data!['results'].toString()}');

    var value = _result.data!['results']
        .map((i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    // print('getTopRatedMovies value ${value.toString()}');

    /// for casting
    List<MovieModel> topRatedList = value.cast<MovieModel>();
    print('getTopRatedMovies value ${topRatedList.length.toString()}');

    final httpResponse = HttpResponse(topRatedList, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<MovieModel>>> getUpComingMovies({
    String? api_key,
    String? language,
    String? accept,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': api_key,
      r'language': language,
      r'Accept': accept,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<MovieModel>>>(Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        )
            .compose(
          _dio.options,
          '/upcoming',
          queryParameters: queryParameters,
          data: _data,
        )
            .copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    // print('getUpComingMovies ${_result.data.toString()}');
    // print('getUpComingMovies ${_result.data!['results'].toString()}');

    var value = _result.data!['results']
        .map((i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    // print('getUpComingMovies value ${value.toString()}');

    /// for casting
    List<MovieModel> upComingList = value.cast<MovieModel>();
    print('getUpComingMovies value ${upComingList.length.toString()}');

    final httpResponse = HttpResponse(upComingList, _result);
    return httpResponse;
  }
  @override
  Future<HttpResponse<MovieModel>> getDetailMovieById(
      String detailsMovie) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<MovieModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              detailsMovie,
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MovieModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

    @override
  Future<HttpResponse<MovieModel>> getDetailsMovieVideo(
      String detailsMovieVideos) async {
      print('getDetailsMovieVideo detailsMovieVideos ${detailsMovieVideos.toString()}');

      const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<MovieModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
          detailsMovieVideos,
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MovieModel.fromJson(_result.data!);
    print('getDetailsMovieVideo value ${value.toString()}');

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }


  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
