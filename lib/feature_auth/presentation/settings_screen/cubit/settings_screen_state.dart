part of 'settings_screen_cubit.dart';

@freezed
class SettingsScreenState with _$SettingsScreenState {
  const factory SettingsScreenState.initial({String? errorMessage}) = _Initial;
  const factory SettingsScreenState.loading() = _Loading;
  const factory SettingsScreenState.loggedOut() = _LoggedOut;
}
