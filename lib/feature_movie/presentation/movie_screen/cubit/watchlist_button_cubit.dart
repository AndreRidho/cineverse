import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/feature_movie/domain/usecase/edit_list_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movie_state_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_button_state.dart';
part 'watchlist_button_cubit.freezed.dart';

class WatchlistButtonCubit extends Cubit<WatchlistButtonState> {
  WatchlistButtonCubit(this._edit, this._getState)
      : super(const WatchlistButtonState.loading());

  final EditListUseCase _edit;
  final GetMovieStateUseCase _getState;

  Future<void> watchlistOrNot(int movieId) async {
    emit(const WatchlistButtonState.loading());

    final result = await _getState.call(GetMovieStateParams(movieId: movieId));

    result.fold(
      (l) {
        if (l is UnauthenticatedFailure) {
          emit(const WatchlistButtonState.unauth());
        } else if (l is NetworkFailure) {
          emit(const WatchlistButtonState.error(
              'Please check your internet connection.'));
        } else if (l is ExceptionFailure) {
          emit(WatchlistButtonState.error(l.message));
        } else {
          emit(const WatchlistButtonState.error('An error occurred.'));
        }
      },
      (r) {
        emit(WatchlistButtonState.loaded(r));
      },
    );
  }

  Future<void> editList(bool addOrRemove, int movieId) async {
    emit(const WatchlistButtonState.loading());

    final result = await _edit
        .call(EditListParams(movieId: movieId, addOrRemove: addOrRemove));

    await result.fold(
      (l) async {
        if (l is UnauthenticatedFailure) {
          emit(const WatchlistButtonState.unauth());
        } else if (l is ExceptionFailure) {
          emit(WatchlistButtonState.error(l.message));
        } else {
          emit(const WatchlistButtonState.error('An error occurred.'));
        }
      },
      (r) async {
        await watchlistOrNot(movieId);
      },
    );
  }
}
