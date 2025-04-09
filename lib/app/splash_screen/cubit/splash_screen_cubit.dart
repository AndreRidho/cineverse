import 'package:bloc/bloc.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:cineverse/feature_auth/domain/use_case/get_account_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_state.dart';
part 'splash_screen_cubit.freezed.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(this._getAccount)
      : super(const SplashScreenState.initial());

  final GetAccountUseCase _getAccount;

  Future<void> checkAccount() async {
    emit(const SplashScreenState.loading());

    final result = await _getAccount.call(NoParams());

    result.fold((l) {
      emit(const SplashScreenState.unauthenticated());
    }, (r) {
      emit(SplashScreenState.authenticated(r));
    });
  }
}
