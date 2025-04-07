import 'package:cineverse/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient with DioMixin implements Dio {
  DioClient._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: kBaseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    this.options = options;

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
      ),
    );

    if (kDebugMode) {
      interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    }

    httpClientAdapter = HttpClientAdapter();
  }

  static Dio getInstance() => DioClient._();
}
