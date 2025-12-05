import 'package:balmoranews/core/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Dio dioFactory(String baseUrl) {
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
  );

  final dio = Dio(options);

  if (kDebugMode || kProfileMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => logger.message(obj.toString()),
      ),
    );
  }

  return dio;
}
