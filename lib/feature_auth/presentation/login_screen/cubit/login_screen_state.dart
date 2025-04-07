part of 'login_screen_cubit.dart';

sealed class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object> get props => [];
}

final class LoginScreenInitial extends LoginScreenState {}
