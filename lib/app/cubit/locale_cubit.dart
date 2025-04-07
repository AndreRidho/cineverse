import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this.prefs) : super(const LocaleState(Locale('en')));

  final SharedPreferences prefs;

  Future<void> get() async {
    emit(LocaleState(Locale(prefs.getString('locale') ?? 'en')));
  }

  Future<void> set(String localeString) async {
    prefs.setString('locale', localeString);
  }
}
