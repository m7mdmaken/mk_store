import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:mk_stationery/core/constants.dart';

class DioFactory {
  DioFactory._(); // Prevent instantiation
  static const String baseUrl = kBaseUrl;

  /// Create a basic Dio instance
  ///
  /// Timeouts are configurable but default to 30 seconds.
  static Dio create({
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? const Duration(seconds: 30),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
        sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add logging in debug mode only
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
          responseBody: true,
          request: true,
          error: true,
        ),
      );
    }

    // Centralized (minimal) error handling interceptor.
    // Keep logic small here; expand as project needs grow.
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          if (kDebugMode) {
            // ignore: avoid_print
            print('Dio error: ${e.error} (${e.response?.statusCode})');
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }

  /// Create Dio with authentication token
  ///
  /// This creates a new Dio instance and sets the Authorization header.
  /// Callers may cache the returned instance if reuse is desired.
  static Dio createWithToken(
    String token, {
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    final dio = create(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
    );
    dio.options.headers['Authorization'] = 'Bearer $token';
    return dio;
  }
}
