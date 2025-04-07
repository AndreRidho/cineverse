part of 'movie_screen_cubit.dart';

@freezed
class MovieScreenState with _$MovieScreenState {
  const factory MovieScreenState.loading() = _Loading;
  const factory MovieScreenState.error(String errorMessage) = _Error;
  const factory MovieScreenState.loaded(
      List<Actor>? actors, Movie? movie, List<Genre>? genres) = _Loaded;
}
