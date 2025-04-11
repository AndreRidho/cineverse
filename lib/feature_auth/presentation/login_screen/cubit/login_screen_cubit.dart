import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:cineverse/feature_auth/domain/use_case/get_account_use_case.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_in_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.dart';
part 'login_screen_cubit.freezed.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit(this._login, this._getAccount)
      : super(const LoginScreenState.initial());

  final LoginUseCase _login;
  final GetAccountUseCase _getAccount;

  Future<void> login(LoginParams params) async {
    emit(const LoginScreenState.loading());

    final result = await _login.call(params);

    await result.fold(
      (l) async {
        String errorMessage = 'An error occurred';

        if (l is NetworkFailure) {
          errorMessage = 'Please check your internet connection.';
        } else if (l is ExceptionFailure) {
          errorMessage = l.message;
        }
        emit(LoginScreenState.initial(errorMessage: errorMessage));
      },
      (r) async {
        final accountResult = await _getAccount.call(NoParams());

        accountResult.fold((l) {
          String errorMessage = 'An error occurred';

          if (l is NetworkFailure) {
            errorMessage = 'Please check your internet connection.';
          } else if (l is ExceptionFailure) {
            errorMessage = l.message;
          } else if (l is UnauthenticatedFailure) {
            errorMessage = 'Login failed.';
          }
          emit(LoginScreenState.initial(errorMessage: errorMessage));
        }, (r) {
          emit(LoginScreenState.authenticated(r));
        });
      },
    );
  }
}
