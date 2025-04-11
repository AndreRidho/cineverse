import 'package:bloc/bloc.dart';
import 'package:cineverse/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this.prefs) : super(const LocaleState.loading());

  final SharedPreferences prefs;

  Future<void> get() async {
    emit(const LocaleState.loading());
    final locale = prefs.getString(kLocale);
    emit(LocaleState.loaded(Locale(locale ?? 'en')));
  }

  Future<void> set(String localeString) async {
    emit(const LocaleState.loading());
    await prefs.setString(kLocale, localeString);
    Restart.restartApp();
  }
}
