import 'package:cineverse/core/remote/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DioDiHelper {
  static final DioDiHelper _instance = DioDiHelper._();
  bool _isRegistered = false;

  DioDiHelper._();

  factory DioDiHelper() {
    return _instance;
  }

  registerLazySingleton(GetIt sl) {
    if (_isRegistered) return;

    _isRegistered = true;

    sl.registerLazySingleton<Dio>(
      () => DioClient.getInstance(),
    );
  }
}
