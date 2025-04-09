part of 'locale_cubit.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.loaded(Locale locale) = _Loaded;
  const factory LocaleState.loading() = _Loading;
}
