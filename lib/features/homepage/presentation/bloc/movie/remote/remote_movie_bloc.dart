
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_events.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_latest_movie_usecase.dart';
import '../../../../domain/usecases/get_popular_movie_usecase.dart';
import '../../../../domain/usecases/get_toprating_movie_usecase.dart';
import '../../../../domain/usecases/get_upcoming_movie_usecase.dart';


class RemoteMovieBloc extends Bloc<RemoteMovieEvents, RemoteMovieState> {

  final GetLatestMovieUseCase _getLatestMovieUseCase;
  final GetPopularMovieUseCase _getPopularMovieUseCase;
  final GetTopRatedMovieUseCase _getTopRatedMovieUseCase;
  final GetUpcomingMovieUseCase _getUpcomingMovieUseCase;

  // for initial state we identify by loading RemoteMovieLoading
  RemoteMovieBloc(this._getLatestMovieUseCase,
      this._getPopularMovieUseCase,
      this._getTopRatedMovieUseCase,
      this._getUpcomingMovieUseCase,) : super(RemoteMovieStateLoading()) {
    on<GetLatestEvent>(
            (GetLatestEvent events, Emitter<RemoteMovieState> emit) async {
          final dataState = await _getLatestMovieUseCase.call();

          if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
            emit(
                RemoteMovieStateDone(dataState.data!)
            );
          }
          if (dataState is DataFailed) {
            print('RMBloc latest message----- Error ${dataState.error?.message}');
            print('RMBloc latest response----- Error ${dataState.error?.response}');
            print('RMBloc latest error----- Error ${dataState.error?.error.toString()}');

            emit(
                RemoteMovieStateError(dataState.error!)
            );
          }
        }
    );

    on<GetPopularEvent>(
            (GetPopularEvent events, Emitter<RemoteMovieState> emit) async {
          final dataState = await _getPopularMovieUseCase.call();

          if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
            emit(
                RemoteMovieStateDone(dataState.data!)
            );
          }
          if (dataState is DataFailed) {
            print('RMBloc popular----- Error ${dataState.error?.message}');
            emit(
                RemoteMovieStateError(dataState.error!)
            );
          }
        }
    );

    on<GetTopRatingEvent>(
            (GetTopRatingEvent events, Emitter<RemoteMovieState> emit) async {
          final dataState = await _getTopRatedMovieUseCase.call();

          if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
            emit(
                RemoteMovieStateDone(dataState.data!)
            );
          }
          if (dataState is DataFailed) {
            print('RMBloc topRating----- Error ${dataState.error?.message}');

            emit(
                RemoteMovieStateError(dataState.error!)
            );
          }
        }
    );

    on<GetUpCommingEvent>(
            (GetUpCommingEvent events, Emitter<RemoteMovieState> emit) async {
          final dataState = await _getUpcomingMovieUseCase.call();

          if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
            emit(
                RemoteMovieStateDone(dataState.data!)
            );
          }
          if (dataState is DataFailed) {
            print('RMBloc upcomming----- Error ${dataState.error?.message}');

            emit(
                RemoteMovieStateError(dataState.error!)
            );
          }
        }
    );
  }
}
