import 'package:cineverse/core/constants/constants.dart';
import 'package:cineverse/core/error/exceptions.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_auth/data/remote/auth_remote_data_source.dart';
import 'package:cineverse/feature_auth/data/remote/dto/account_dto.dart';
import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:cineverse/feature_auth/domain/repository/auth_repository.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_in_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final SharedPreferences _prefs;

  AuthRepositoryImpl(
      {required AuthRemoteDataSource remote, required SharedPreferences prefs})
      : _remote = remote,
        _prefs = prefs;

  @override
  Future<Either<Failure, Account>> getAccount(NoParams params) async {
    try {
      final sessionId = _prefs.getString(kSessionId);

      if (sessionId == null) {
        return Left(UnauthenticatedFailure());
      } else {
        final account = await _getAndSetAccountId(sessionId);

        return Right(account);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(UnauthenticatedFailure());
      }

      return Left(NetworkFailure());
    } on CacheException {
      return const Left(ExceptionFailure("An error occurred"));
    } catch (e) {
      return const Left(ExceptionFailure("An error occurred"));
    }
  }

  @override
  Future<Either<Failure, void>> login(LoginParams params) async {
    try {
      final String requestToken =
          (await _remote.createRequestToken(apiKey: kApiKey))['request_token'];
      await _remote.validateWithLogin(apiKey: kApiKey, credentials: {
        "username": params.username,
        "password": params.password,
        "request_token": requestToken
      });
      final sessionResult = await _remote.createSession(
          apiKey: kApiKey, requestToken: {"request_token": requestToken});

      final sessionId = sessionResult['session_id'];
      await _getAndSetAccountId(sessionId);

      await _prefs.setString(kSessionId, sessionId);

      return const Right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(ExceptionFailure(e.response?.data['status_message']));
      }

      return Left(NetworkFailure());
    } on CacheException {
      return const Left(ExceptionFailure("An error occurred"));
    } catch (e) {
      return Left(ExceptionFailure(e.toString()));
    }
  }

  Future<Account> _getAndSetAccountId(String sessionId) async {
    final getAccountDetailsResult =
        await _remote.getAccountDetails(sessionId: sessionId);

    final account = AccountDto.fromJson(getAccountDetailsResult);

    await _prefs.setInt(kAccountId, account.id);

    return account.toEntity().toModel();
  }

  @override
  Future<Either<Failure, void>> logout(NoParams params) async {
    try {
      final result = await _prefs.remove(kAccountId) &&
          await _prefs.remove(kSessionId) &&
          await _prefs.remove(kLocale);

      if (result) {
        return const Right(null);
      }

      throw CacheException();
    } on CacheException {
      return const Left(ExceptionFailure("An error occurred."));
    } catch (e) {
      return const Left(ExceptionFailure("An error occurred."));
    }
  }
}
