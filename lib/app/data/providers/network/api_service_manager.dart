import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';

class MyFoodDio extends DioForNative {
  final DataStore dataStore;

  MyFoodDio({
    BaseOptions? options,
    required this.dataStore,
  }) : super(options) {
    interceptors.add(ApiServiceManagerInterceptors());
  }

  MyFoodDio addAuth() {
    if (dataStore.getAccessToken().isNotEmpty) {
      options.headers = {
        "Authorization": dataStore.getAccessToken(),
      };
    }
    return this;
  }
}

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
    switch (options.method) {
      case "POST":
        if (options.data != null) {
          options.headers = {
            Headers.contentTypeHeader: Headers.jsonContentType,
          };
        }
        break;
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    handleErrorResponse(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final response = err.response;
    handleErrorResponse(response);

    super.onError(err, handler);
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
