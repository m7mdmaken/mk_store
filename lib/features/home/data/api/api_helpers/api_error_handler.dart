import 'dart:io';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

/// Handles API errors and converts them to [ApiErrorModel]
class ApiErrorHandler {
  /// Handle general exceptions
  static ApiErrorModel handleException(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is SocketException) {
      return const ApiErrorModel(
        message: 'No internet connection. Please check your connection.',
      );
    }

    if (error is FormatException) {
      return const ApiErrorModel(message: 'Invalid data format received.');
    }

    return ApiErrorModel(
      message: 'An unexpected error occurred: ${error.toString()}',
    );
  }

  /// Handle DioException and convert to ApiErrorModel
  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiErrorModel(
          message: 'Connection timeout. Please try again.',
          statusCode: 408,
        );

      case DioExceptionType.sendTimeout:
        return const ApiErrorModel(
          message: 'Request send timeout. Please try again.',
          statusCode: 408,
        );

      case DioExceptionType.receiveTimeout:
        return const ApiErrorModel(
          message: 'Server response timeout. Please try again.',
          statusCode: 408,
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);

      case DioExceptionType.cancel:
        return const ApiErrorModel(message: 'Request was cancelled.');

      case DioExceptionType.connectionError:
        return const ApiErrorModel(
          message: 'No internet connection. Please check your connection.',
        );

      case DioExceptionType.badCertificate:
        return const ApiErrorModel(message: 'Certificate verification failed.');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const ApiErrorModel(
            message: 'No internet connection. Please check your connection.',
          );
        }
        return ApiErrorModel(
          message: 'Unexpected error: ${error.message ?? "Unknown error"}',
        );
    }
  }

  /// Handle HTTP response errors based on status code
  static ApiErrorModel _handleResponseError(Response? response) {
    if (response == null) {
      return const ApiErrorModel(message: 'Unknown error occurred');
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    // Try to extract error message from response
    String errorMessage = _extractErrorMessage(data);

    switch (statusCode) {
      case 400:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Bad request' : errorMessage,
          statusCode: statusCode,
        );

      case 401:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Unauthorized access' : errorMessage,
          statusCode: statusCode,
        );

      case 403:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Access forbidden' : errorMessage,
          statusCode: statusCode,
        );

      case 404:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Resource not found' : errorMessage,
          statusCode: statusCode,
        );

      case 408:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Request timeout' : errorMessage,
          statusCode: statusCode,
        );

      case 409:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Conflict error' : errorMessage,
          statusCode: statusCode,
        );

      case 422:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Unprocessable entity' : errorMessage,
          statusCode: statusCode,
        );

      case 500:
        return ApiErrorModel(
          message:
              errorMessage.isEmpty ? 'Internal server error' : errorMessage,
          statusCode: statusCode,
        );

      case 503:
        return ApiErrorModel(
          message: errorMessage.isEmpty ? 'Service unavailable' : errorMessage,
          statusCode: statusCode,
        );

      default:
        return ApiErrorModel(
          message:
              errorMessage.isEmpty
                  ? 'Error occurred with status code: $statusCode'
                  : errorMessage,
          statusCode: statusCode,
        );
    }
  }

  /// Extract error message from response data
  static String _extractErrorMessage(dynamic data) {
    if (data == null) return '';

    try {
      // Handle different response formats
      if (data is Map<String, dynamic>) {
        // Try common error message keys
        if (data.containsKey('message')) {
          return data['message'].toString();
        }
        if (data.containsKey('error')) {
          final error = data['error'];
          if (error is String) return error;
          if (error is Map && error.containsKey('message')) {
            return error['message'].toString();
          }
        }
        if (data.containsKey('errors')) {
          final errors = data['errors'];
          if (errors is List && errors.isNotEmpty) {
            return errors.join(', ');
          }
          if (errors is Map) {
            return errors.values.join(', ');
          }
        }
      }

      if (data is String) {
        return data;
      }
    } catch (e) {
      return '';
    }

    return '';
  }
}
