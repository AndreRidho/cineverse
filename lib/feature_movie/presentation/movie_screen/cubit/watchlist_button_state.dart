part of 'watchlist_button_cubit.dart';

@freezed
class WatchlistButtonState with _$WatchlistButtonState {
  const factory WatchlistButtonState.loading() = _Loading;
  const factory WatchlistButtonState.loaded(bool watchlist) = _Loaded;
  const factory WatchlistButtonState.error(String errorMessage) = _Error;
  const factory WatchlistButtonState.unauth() = _Unauth;
}
