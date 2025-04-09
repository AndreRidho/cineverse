part of 'login_screen_cubit.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState.initial({String? errorMessage}) = _Initial;
  const factory LoginScreenState.loading() = _Loading;
  const factory LoginScreenState.authenticated(Account account) =
      _Authenticated;
}
