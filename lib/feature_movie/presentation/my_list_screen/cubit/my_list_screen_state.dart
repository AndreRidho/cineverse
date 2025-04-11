part of 'my_list_screen_cubit.dart';

@freezed
class MyListScreenState with _$MyListScreenState {
  const factory MyListScreenState.loading() = _Loading;
  const factory MyListScreenState.loaded(List<Movie> movies) = _Loaded;
  const factory MyListScreenState.error(String errorMessage) = _Error;
  const factory MyListScreenState.unauth() = _Unauth;
}
