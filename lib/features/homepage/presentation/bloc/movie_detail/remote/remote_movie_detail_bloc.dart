
import 'package:movie_app/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie_detail/remote/remote_movie_detail_events.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie_detail/remote/remote_movie_detail_state.dart';

import '../../../../domain/usecases/get_detail_movie_usecase.dart';


class RemoteMovieDetailBloc extends Bloc<RemoteMovieDetailEvents, RemoteMovieDetailState> {

  final GetDetailMovieUseCase _getDetailMovieUseCase;

  // for initial state we identify by loading RemoteMovieLoading
  RemoteMovieDetailBloc(this._getDetailMovieUseCase,) : super(const RemoteMovieDetailStateLoading()) {
    on<GetDetailMovieEvent>(
            (GetDetailMovieEvent events, Emitter<RemoteMovieDetailState> emit) async {
          final dataState = await _getDetailMovieUseCase.call();

          if (dataState is DataSuccess && dataState.data!= null) {
            emit(
                RemoteMovieDetailStateDone(dataState.data!)
            );
          }
          if (dataState is DataFailed) {
            print('RMBloc details----- Error ${dataState.error?.message}');
            emit(
                RemoteMovieDetailStateError(dataState.error!)
            );
          }
        }
    );

  }
}
