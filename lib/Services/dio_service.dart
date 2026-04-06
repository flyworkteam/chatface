import 'dart:io';

import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/utils/app_config.dart';
import 'package:chatface/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioService {
  DioService(this.ref) {
    _addInterceptors();
  }
  final Ref ref;

  Dio get dio => _dio;

  // Base URL - automatically adjusted for platform
  static String get _baseUrl => AppConfig.apiBaseUrl();

  static final _headers = <String, Object?>{
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers':
        'Origin, Content-Type, Accept, Authorization, X-Requested-With',
  };

  final _dio = Dio(BaseOptions(headers: _headers));

  Future<void> _logApiRequest({
    required final String method,
    required final String path,
    final Map<String, Object?>? queryParameters,
    final Object? data,
  }) async {
    final platform = kIsWeb ? 'web' : Platform.operatingSystem;

    Print.info(
      'API Request - method: $method, path: $path'
      ' platform: $platform, '
      'baseUrl: $_baseUrl'
      '${queryParameters != null && queryParameters.isNotEmpty ? ' query: $queryParameters' : ''}'
      '${data != null ? ' data: $data' : ''}',
    );
  }

  Future<Response> get(
    final String path, {
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
    final Options? options,
    final Map<String, Object?>? queryParameters,
  }) async {
    await _logApiRequest(
      method: 'GET',
      path: path,
      queryParameters: queryParameters,
    );
    try {
      return await _dio.get(
        _baseUrl + path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Print.info('Attempting to refresh access token...');

      final storageService = ref.read(
        AllProviders.secureStorageServiceProvider,
      );
      final refreshToken = await storageService.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        Print.error('No refresh token available');
        await storageService.clearAll();
        return false;
      }

      // Call the refresh endpoint
      final response = await _dio.post(
        '${_baseUrl}auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final tokens = data['tokens'];

        // Save new tokens
        await storageService.saveTokens(
          accessToken: tokens['accessToken'] as String,
          refreshToken: tokens['refreshToken'] as String,
        );

        Print.info('Token refresh successful');
        return true;
      }

      Print.error('Token refresh failed with status: ${response.statusCode}');
      await storageService.clearAll();
      return false;
    } catch (e, st) {
      Print.error('Token refresh error: $e');
      Print.error('Stack trace: $st');

      // Clear storage on refresh failure
      try {
        final storageService = ref.read(
          AllProviders.secureStorageServiceProvider,
        );
        await storageService.clearAll();
      } catch (_) {}

      return false;
    }
  }

  Future<Response> _retry(final RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<Response> postRaw(
    final String path, {
    required final Object? data,
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
    final void Function(int, int)? onSendProgress,
    final Options? options,
    final Map<String, Object?>? queryParameters,
  }) async {
    await _logApiRequest(
      method: 'POST',
      path: path,
      queryParameters: queryParameters,
      data: data,
    );
    try {
      return await _dio.post(
        _baseUrl + path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> post(
    final String path, {
    final Object? data,
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
    final void Function(int, int)? onSendProgress,
    final Options? options,
    final Map<String, Object?>? queryParameters,
  }) async {
    return postRaw(
      path,
      data: data,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(
    final String path, {
    final Object? data,
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
    final void Function(int, int)? onSendProgress,
    final Options? options,
    final Map<String, Object?>? queryParameters,
  }) async {
    await _logApiRequest(
      method: 'PUT',
      path: path,
      queryParameters: queryParameters,
      data: data,
    );
    try {
      return await _dio.put(
        _baseUrl + path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> patch(
    final String path, {
    final Object? data,
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
    final void Function(int, int)? onSendProgress,
    final Options? options,
    final Map<String, Object?>? queryParameters,
  }) async {
    await _logApiRequest(
      method: 'PATCH',
      path: path,
      queryParameters: queryParameters,
      data: data,
    );
    try {
      return await _dio.patch(
        _baseUrl + path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> postForm(
    final String path, {
    required final FormData formData,
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
    final void Function(int, int)? onSendProgress,
    final Options? options,
    final Map<String, Object?>? queryParameters,
  }) async {
    await _logApiRequest(
      method: 'POST_FORM',
      path: path,
      queryParameters: queryParameters,
      data: formData.fields,
    );
    try {
      return await _dio.post(
        _baseUrl + path,
        data: formData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> delete(
    final String path, {
    final CancelToken? cancelToken,
    final Options? options,
    final Map<String, Object?>? queryParameters,
    final Object? data,
  }) async {
    await _logApiRequest(
      method: 'DELETE',
      path: path,
      queryParameters: queryParameters,
      data: data,
    );
    try {
      return await _dio.delete(
        _baseUrl + path,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
        data: data,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  void _addInterceptors() {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (final options, final handler) async {
          // Add JWT token to Authorization header
          try {
            final storageService = ref.read(
              AllProviders.secureStorageServiceProvider,
            );
            final token = await storageService.getAccessToken();

            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              Print.info('Added Authorization header to request');
            }
          } catch (e) {
            Print.error('Error adding auth header: $e');
          }
          return handler.next(options);
        },
        onResponse: (final response, final handler) {
          return handler.next(response);
        },
        onError: (final e, final handler) async {
          Print.error(
            'Error occurred: ${e.message} handler: $handler ${_dio.options.baseUrl}',
          );
          if (e.response?.statusCode == 401) {
            final success = await _refreshToken();
            if (success) {
              return handler.resolve(await _retry(e.requestOptions));
            }
          }
          return handler.next(e);
        },
      ),
    ]);
  }
}

class CustomException implements Exception {
  CustomException.fromDioError(final DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        detailedMessage = 'API request was cancelled by user or timeout';
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout';
        detailedMessage = 'Could not connect to server within timeout period';
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout';
        detailedMessage = 'Server took too long to respond';
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode ?? 0;
        final responseData = dioError.response?.data;

        message = _handleResponseError(statusCode, responseData);
        detailedMessage = _buildDetailedErrorMessage(statusCode, responseData);

      case DioExceptionType.sendTimeout:
        message = 'Send timeout';
        detailedMessage = 'Could not send data to server within timeout period';
      case DioExceptionType.unknown:
        message = 'Connection failed';
        detailedMessage = 'No internet connection or server is unreachable';
      default:
        message = 'Unknown error';
        detailedMessage = 'An unexpected error occurred: ${dioError.message}';
    }
  }

  late String message;
  late String detailedMessage;

  String _handleResponseError(final int statusCode, final data) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 422:
        return 'Validation Failed';
      case 500:
        return 'Server Error';
      case 502:
        return 'Bad Gateway';
      case 503:
        return 'Service Unavailable';
      default:
        return 'Error $statusCode';
    }
  }

  String _buildDetailedErrorMessage(final int statusCode, final dynamic data) {
    final buffer = StringBuffer();
    buffer.writeln('Status Code: $statusCode');

    if (data == null) {
      buffer.writeln('No additional error information provided');
      return buffer.toString();
    }

    // Handle Map response (most common)
    if (data is Map) {
      // Extract main message
      final mainMessage = data['message'] ?? data['error'] ?? 'Unknown error';
      buffer.writeln('Message: $mainMessage');

      // Handle validation errors (array format)
      if (data['errors'] != null) {
        buffer.writeln('\nValidation Errors:');

        final errors = data['errors'];
        if (errors is List) {
          for (var i = 0; i < errors.length; i++) {
            final error = errors[i];
            if (error is Map) {
              final field = error['field'] ?? error['path'] ?? 'unknown';
              final errMsg =
                  error['message'] ?? error['msg'] ?? 'Invalid value';
              final receivedValue = error['receivedValue'] ?? error['value'];
              final expectedConstraint =
                  error['expectedConstraint'] ?? error['constraint'];

              buffer.writeln('  ${i + 1}. Field: $field');
              buffer.writeln('     Error: $errMsg');
              if (receivedValue != null) {
                buffer.writeln('     Received: $receivedValue');
              }
              if (expectedConstraint != null) {
                buffer.writeln('     Expected: $expectedConstraint');
              }

              // Handle suggestion if available
              if (error['suggestion'] != null) {
                buffer.writeln('     Suggestion: ${error['suggestion']}');
              }
            } else {
              buffer.writeln('  ${i + 1}. $error');
            }
          }
        } else if (errors is Map) {
          // Handle errors as object with field names as keys
          errors.forEach((key, value) {
            buffer.writeln('  • $key: $value');
          });
        }
      }

      // Handle single error message
      if (data['error_description'] != null) {
        buffer.writeln('\nDescription: ${data['error_description']}');
      }

      // Handle data field if present
      if (data['data'] != null && data['data'] is Map) {
        final dataMap = data['data'] as Map;
        if (dataMap.isNotEmpty) {
          buffer.writeln('\nAdditional Info:');
          dataMap.forEach((key, value) {
            buffer.writeln('  • $key: $value');
          });
        }
      }
    }
    // Handle String response
    else if (data is String) {
      buffer.writeln('Message: $data');
    }
    // Handle other types
    else {
      buffer.writeln('Response: $data');
    }

    return buffer.toString();
  }

  @override
  String toString() {
    return '$message\n\n$detailedMessage';
  }

  // Get just the summary message
  String get summary => message;

  // Get the full detailed message
  String get details => detailedMessage;
}
