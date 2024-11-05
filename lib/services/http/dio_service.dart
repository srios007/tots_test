import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/app/app.router.dart';

import 'dio_exceptions.dart';

class DioService {
  DioService._();

  static final instance = DioService._();

  Future<Dio> dioConfig({bool requiresAuth = false}) async {
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

    if (requiresAuth) {
      final box = GetStorage();
      final token = box.read('token');
      if (token != null) {
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = 'Bearer $token';
            return handler.next(options);
          },
        ));
      } else {
        final navigationService = locator<NavigationService>();
        navigationService.replaceWith(Routes.loginView);
      }
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log('Request URL: ${options.uri}');
        log('Request Headers: ${options.headers}');
        return handler.next(options);
      },
    ));

    return dio;
  }

  /// Get Method
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    bool requiresAuth = false,
  }) async {
    try {
      final dio = await dioConfig(requiresAuth: requiresAuth);
      final Response response = await dio.get(
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
    bool requiresAuth = false,
  }) async {
    try {
      final dio = await dioConfig(requiresAuth: requiresAuth);
      final Response response = await dio.post(
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

  /// Put Method
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool requiresAuth = false,
    String? baseUrl,
  }) async {
    try {
      final dio = await dioConfig(requiresAuth: requiresAuth);
      final Response response = await dio.put(
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

  /// Delete Method
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    bool requiresAuth = false,
  }) async {
    try {
      final dio = await dioConfig(requiresAuth: requiresAuth);
      final Response response = await dio.delete(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e);
      log('error: ${error.errorMessage}');
      return null;
    }
  }
}
