part of 'splash_screen_cubit.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _Initial;
  const factory SplashScreenState.loading() = _Loading;
  const factory SplashScreenState.authenticated(Account account) =
      _Authenticated;
  const factory SplashScreenState.unauthenticated() = _Unauthenticated;
}
