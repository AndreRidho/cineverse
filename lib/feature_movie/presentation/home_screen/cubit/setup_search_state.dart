part of 'setup_search_cubit.dart';

@freezed
class SetupSearchState with _$SetupSearchState {
  const factory SetupSearchState.loading() = _Loading;
  const factory SetupSearchState.error(String errorMessage) = _Error;
  const factory SetupSearchState.loaded(
      List<Genre> genres, List<Language> languages) = _Loaded;
}
