import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<void, LoginParams> {
  final AuthRepository _repo;

  const LoginUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(LoginParams params) => _repo.login(params);
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}
