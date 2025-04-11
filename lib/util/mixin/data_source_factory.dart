import 'package:cineverse/core/error/exceptions.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

mixin DataSourceFactory {
  Future<Either<Failure, List<Model>>> dataSourceFactory<Dto, Entity, Model>({
    required String apiName,
    required String paramsString,
    required bool Function(String apiKey) checkCacheValidity,
    required Right<Failure, List<Model>> Function(String apiKey) local,
    required Function(String apiKey) clear,
    required Future<List<Dto>> Function(String apiKey) remote,
    required Entity Function(Dto dto) toEntity,
    required Function(String apiName, String apiKey, List<Entity> entities)
        save,
  }) async {
    final apiKey = '$apiName?$paramsString';

    try {
      // print('debug dsf a apikey: $apiKey');
      if (checkCacheValidity(apiKey)) {
        // print('debug dsf b');
        return local(apiKey);
      }
      // print('debug dsf c');

      List<Dto> dtos = await remote(apiKey);

      // print('debug dsf d $dtos');
      final entities = dtos.map((e) => toEntity(e)).toList();

      print('debug dsfcheck d $entities');
      print('debug dsfcheck apiKey $apiKey');
      print('debug dsfcheck apiName $apiName');
      print('debug dsfcheck entities $entities');
      clear(apiKey);

      save(apiName, apiKey, entities);

      final result = local(apiKey);

      print('debug dsfcheck g $result');
      return result;
    } on DioException {
      // print('debug dsf h');
      return local(apiKey);
    } on UnauthenticatedException {
      return Left(UnauthenticatedFailure());
    } on CacheException {
      return const Right([]);
    } catch (e) {
      // print('debug dsf $e');
      return const Left(ExceptionFailure("An error occurred."));
    }
  }

  Future<Either<Failure, Model>> singleDataSourceFactory<Dto, Entity, Model>({
    required String apiName,
    required String paramsString,
    required bool Function(String apiKey) checkCacheValidity,
    required Model? Function(String apiKey) local,
    required Function(String apiKey) clear,
    required Future<Dto> Function(String apiKey) remote,
    required Entity Function(Dto dto) toEntity,
    required Function(String apiName, String apiKey, List<Entity> entity) save,
  }) async {
    final apiKey = '$apiName?$paramsString';

    try {
      // print('debug dsf a apikey: $apiKey');
      if (checkCacheValidity(apiKey)) {
        // print('debug dsf b');
        final model = local(apiKey);

        if (model != null) return Right(model);
      }
      // print('debug dsf c');

      Dto dto = await remote(apiKey);

      // print('debug dsf d $dtos');
      final entity = toEntity(dto);

      // print('debug dsf d $entities');
      // print('debug dsf e');
      clear(apiKey);

      // print('debug dsf f');
      save(apiName, apiKey, [entity]);

      // print('debug dsf g');
      final model = local(apiKey);

      if (model != null) return Right(model);

      throw CacheException();
    } on DioException {
      // print('debug dsf h');
      final model = local(apiKey);

      if (model != null) return Right(model);

      throw CacheException();
    } on CacheException {
      return const Left(ExceptionFailure("An error occurred."));
    } catch (e) {
      // print('debug dsf $e');
      return const Left(ExceptionFailure("An error occurred."));
    }
  }
}
