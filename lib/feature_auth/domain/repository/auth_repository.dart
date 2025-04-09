import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_in_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Account>> getAccount(NoParams params);
  Future<Either<Failure, void>> login(LoginParams params);
  Future<Either<Failure, void>> logout(NoParams params);
}
