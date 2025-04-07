import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_screen_state.dart';

class AccountScreenCubit extends Cubit<AccountScreenState> {
  AccountScreenCubit() : super(AccountScreenInitial());
}
