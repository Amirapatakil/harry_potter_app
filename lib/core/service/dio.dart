import 'dart:developer';

import 'package:dio/dio.dart';

class DioSetting {
  final Dio dio;

  DioSetting()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://potterapi-fedeperin.vercel.app/en/',
            connectTimeout: const Duration(milliseconds: 3000),
            sendTimeout: const Duration(milliseconds: 3000),
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          log('Request: ${options.method}, ${options.path}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          log('Response: ${response.statusCode}, ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          log('Error: ${error.error}, ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }
}
