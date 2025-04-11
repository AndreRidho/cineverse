import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_watchlist_movies_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_list_screen_state.dart';
part 'my_list_screen_cubit.freezed.dart';

class MyListScreenCubit extends Cubit<MyListScreenState> {
  MyListScreenCubit(this._get) : super(const MyListScreenState.loading());

  final GetWatchListMoviesUseCase _get;

  Future<void> get() async {
    emit(const MyListScreenState.loading());

    final result = await _get.call(NoParams());

    result.fold(
      (l) {
        if (l is UnauthenticatedFailure) {
          emit(const MyListScreenState.unauth());
        } else if (l is NetworkFailure) {
          emit(const MyListScreenState.error(
              'Please check your internet connection.'));
        } else if (l is ExceptionFailure) {
          emit(MyListScreenState.error(l.message));
        } else {
          emit(const MyListScreenState.error('An error occurred.'));
        }
      },
      (r) {
        emit(MyListScreenState.loaded(r));
      },
    );
  }
}
