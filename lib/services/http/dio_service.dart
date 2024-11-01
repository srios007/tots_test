import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dio_exceptions.dart';

class DioService {
  DioService._();

  static final instance = DioService._();

  dioConfig() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );

    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.forceCache,
    );

    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    return dio;
  }

  ///Get Method
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dioConfig().get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: only_throw_errors
      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }

  /// Post Method
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dioConfig().post(
        path,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e);
      log('error: ${error.errorMessage}');
      return null;
    }
  }
}
