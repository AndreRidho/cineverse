import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository _repo;

  const LogOutUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(NoParams params) => _repo.logout(params);
}
