part of 'account_screen_cubit.dart';

@freezed
class AccountScreenState with _$AccountScreenState {
  const factory AccountScreenState.loading() = _Loading;
  const factory AccountScreenState.loaded(Account account) = _Loaded;
  const factory AccountScreenState.unauth() = _Unauth;
  const factory AccountScreenState.error(String errorMessage) = _Error;
}
