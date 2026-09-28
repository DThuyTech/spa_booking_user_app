import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../constants/app_constants.dart';
import 'idempotency/idempotency_policy.dart';
import 'network_client.dart';

class DioClient implements NetworkClient {
  final Dio dio;

  DioClient({required Dio dioClient, required AppConfig appConfig})
    : dio = dioClient {
    dio.options = BaseOptions(
      baseUrl: appConfig.apiBaseUrl,
      connectTimeout: appConfig.connectTimeout,
      receiveTimeout: appConfig.receiveTimeout,
      headers: {
        AppConstants.headerContentType: AppConstants.contentTypeJson,
        'Accept': AppConstants.contentTypeJson,
      },
    );
  }

  String _resolvePath(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }
    if (path.startsWith('/api/v1')) {
      return path;
    }
    if (path.startsWith('api/v1')) {
      return '/$path';
    }
    final normalized = path.startsWith('/') ? path : '/$path';
    return '/api/v1$normalized';
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return dio.get<T>(
      _resolvePath(path),
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? idempotencyKey,
  }) {
    final opts = options ?? Options();
    if (idempotencyKey != null && idempotencyKey.isNotEmpty) {
      opts.extra = {...?opts.extra, IdempotencyPolicy.extraKey: idempotencyKey};
    }
    return dio.post<T>(
      _resolvePath(path),
      data: data,
      queryParameters: queryParameters,
      options: opts,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return dio.put<T>(
      _resolvePath(path),
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? idempotencyKey,
  }) {
    final opts = options ?? Options();
    if (idempotencyKey != null && idempotencyKey.isNotEmpty) {
      opts.extra = {...?opts.extra, IdempotencyPolicy.extraKey: idempotencyKey};
    }
    return dio.patch<T>(
      _resolvePath(path),
      data: data,
      queryParameters: queryParameters,
      options: opts,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return dio.delete<T>(
      _resolvePath(path),
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
