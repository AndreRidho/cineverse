import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([
    List properties = const <dynamic>[],
  ]);
}

class ExceptionFailure extends Failure {
  final String message;

  const ExceptionFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class UnauthenticatedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}
