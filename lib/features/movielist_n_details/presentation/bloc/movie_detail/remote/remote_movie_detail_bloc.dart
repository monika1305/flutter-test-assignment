
import 'package:movie_app/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_events.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_state.dart';

import '../../../../domain/usecases/get_detail_movie_usecase.dart';
import '../../../../domain/usecases/get_detail_movie_video_usecase.dart';


class RemoteMovieDetailBloc extends Bloc<RemoteMovieDetailEvents, RemoteMovieDetailState> {

  final GetDetailMovieUseCase _getDetailMovieUseCase;
  final GetDetailMovieVideoUseCase _getDetailMovieVideoUseCase;

  // for initial state we identify by loading RemoteMovieLoading
  RemoteMovieDetailBloc(this._getDetailMovieUseCase,
      this._getDetailMovieVideoUseCase)
      : super(const RemoteMovieDetailState()) {

    on<GetDetailMovieEvent>(
            (GetDetailMovieEvent events, Emitter<RemoteMovieDetailState> emit) async {
              print('RemoteMovieDetailBloc events.id ==== ${events.id}');

              final dataState = await _getDetailMovieUseCase.call(params: events.id);

          if (dataState is DataSuccess && dataState.data!= null) {
            print('RMBloc details  ==== ${dataState.data}');
            emit(
                state.copyWith(
                    detailsData: dataState.data, enumRequestdetails: EnumRequest.loded)

            );
          }
          if (dataState is DataFailed) {
            print('RMBloc details----- Error ${dataState.error?.message}');
            emit(
                state.copyWith(
                    enumRequestdetails: EnumRequest.error, messagedetails: dataState.error?.message)

            );
          }
        }
    );    on<GetDetailMovieVideoEvent>(
            (GetDetailMovieVideoEvent events, Emitter<RemoteMovieDetailState> emit) async {
              print('RemoteMovieDetailBloc GetDetailMovieVideoEvent events.id ==== ${events.id}');

              final dataState = await _getDetailMovieVideoUseCase.call(params: events.id);

          if (dataState is DataSuccess && dataState.data!= null) {
            print('RMBloc GetDetailMovieVideoEvent  ==== ${dataState.data}');
            emit(
                state.copyWith(
                    detailsData: dataState.data, enumRequestdetails: EnumRequest.loded)

            );
          }
          if (dataState is DataFailed) {
            print('RMBloc GetDetailMovieVideoEvent----- Error ${dataState.error?.message}');
            emit(
                state.copyWith(
                    enumRequestdetails: EnumRequest.error, messagedetails: dataState.error?.message)

            );
          }
        }
    );

  }
}
