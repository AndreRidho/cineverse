import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:cineverse/feature_auth/domain/use_case/get_account_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_screen_state.dart';
part 'account_screen_cubit.freezed.dart';

class AccountScreenCubit extends Cubit<AccountScreenState> {
  AccountScreenCubit(this._get) : super(const AccountScreenState.loading());

  final GetAccountUseCase _get;

  Future<void> get() async {
    emit(const AccountScreenState.loading());

    final result = await _get.call(NoParams());

    result.fold(
      (l) {
        if (l is UnauthenticatedFailure) {
          emit(const AccountScreenState.unauth());
        } else if (l is NetworkFailure) {
          emit(const AccountScreenState.error(
              'Please check your internet connection.'));
        } else if (l is ExceptionFailure) {
          emit(AccountScreenState.error(l.message));
        } else {
          emit(const AccountScreenState.error('An error occurred.'));
        }
      },
      (r) {
        emit(AccountScreenState.loaded(r));
      },
    );
  }
}
