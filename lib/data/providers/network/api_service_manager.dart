import 'dart:convert';

import 'package:dio/dio.dart';

class ApiServiceManagerInterceptors extends Interceptor {
  static const String _baseUrl = "https://myfood-server.herokuapp.com/";
  static const String _statusKey = "status";
  static const String _successValue = "success";
  static const String _errorValue = "error";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    options.baseUrl = _baseUrl;
    options.connectTimeout = 60000;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    handleErrorResponse(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    final response = err.response;
    handleErrorResponse(response);
  }

  void handleErrorResponse(Response<dynamic>? response) {
    if (response?.statusCode == 200) {
      final jsonResponse = response?.data;
      if (jsonResponse[_statusKey] == _errorValue) {
        final error = jsonResponse[_errorValue];
        String errorString = json.encode(error);
        throw ApiServiceManagerException(
          requestOptions: RequestOptions(
            path: response?.requestOptions.path ?? "",
          ),
          error: errorString,
        );
      }
    } else {
      final jsonResponse = response?.data;
      final error = jsonResponse[_errorValue];
      String errorString = json.encode(error);
      throw ApiServiceManagerException(
        requestOptions: RequestOptions(
          path: response?.requestOptions.path ?? "",
        ),
        error: errorString,
      );
    }
  }
}

class ApiServiceManagerException extends DioError {
  ApiServiceManagerException({
    required RequestOptions requestOptions,
    error,
  }) : super(
          requestOptions: requestOptions,
          type: DioErrorType.response,
          error: error,
        );
}
