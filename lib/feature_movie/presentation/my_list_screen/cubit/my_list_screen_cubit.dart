import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_watchlist_movies_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_list_screen_state.dart';
//TODO: localization
part 'my_list_screen_cubit.freezed.dart';

class MyListScreenCubit extends Cubit<MyListScreenState> {
  MyListScreenCubit(this._get) : super(const MyListScreenState.loading());

  final GetWatchListMoviesUseCase _get;

  Future<void> get() async {
    print('debug cubit mylist');
    emit(const MyListScreenState.loading());

    final result = await _get.call(NoParams());

    result.fold(
      (l) {
        if (l is UnauthenticatedFailure) {
          print('debug cubit mylist a');
          emit(const MyListScreenState.unauth());
        } else if (l is NetworkFailure) {
          emit(const MyListScreenState.error(
              'Please check your internet connection.'));
        } else if (l is ExceptionFailure) {
          print('debug cubit mylist b ${l.message}');
          emit(MyListScreenState.error(l.message));
        } else {
          print('debug cubit mylist c');
          emit(const MyListScreenState.error('An error occurred.'));
        }
      },
      (r) {
        print('debug cubit mylist d');
        emit(MyListScreenState.loaded(r));
      },
    );
  }
}
