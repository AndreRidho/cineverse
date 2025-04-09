import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:cineverse/feature_auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetAccountUseCase implements UseCase<Account, NoParams> {
  final AuthRepository _repo;

  const GetAccountUseCase(this._repo);

  @override
  Future<Either<Failure, Account>> call(NoParams params) =>
      _repo.getAccount(params);
}
