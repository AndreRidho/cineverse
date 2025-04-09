import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_out_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_screen_state.dart';
part 'settings_screen_cubit.freezed.dart';

class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  SettingsScreenCubit(this._logOut)
      : super(const SettingsScreenState.initial());

  final LogOutUseCase _logOut;

  Future<void> logOut() async {
    emit(const SettingsScreenState.loading());

    final result = await _logOut.call(NoParams());

    result.fold(
      (l) => emit(SettingsScreenState.initial(
          errorMessage: (l as ExceptionFailure).message)),
      (r) => emit(const SettingsScreenState.loggedOut()),
    );
  }
}
