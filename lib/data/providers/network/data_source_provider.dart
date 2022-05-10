import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/providers/shared_preference/shared_preference.dart';

class DataSourceProvider {
  final _dio = Dio();
  static const String _baseUrl = "https://myfood-server.herokuapp.com/";
  static const String _statusKey = "status";
  static const String _successValue = "success";
  static const String _errorValue = "error";

  DataSourceProvider({required this.sharedPreference});

  SharedPreference sharedPreference;

  Future<Map<String, dynamic>> httpGet(
    String path,
    DataSourceType dataSourceType,
  ) async {
    final response = await _dio.get(
      "$_baseUrl$path",
      options: Options(
        headers: await _getHeaders(dataSourceType),
      ),
    );

    return await _getResponse(response);
  }

  Future<Map<String, dynamic>> httpPost(
    String path,
    DataSourceType dataSourceType, {
    Object? body,
  }) async {
    final response = await _dio.post(
      "$_baseUrl$path",
      options: Options(
        headers: await _getHeaders(dataSourceType),
      ),
      data: body,
    );

    return await _getResponse(response);
  }

  Future<Map<String, String>> _getHeaders(DataSourceType dataSourceType) async {
    Map<String, String> headers;
    if (dataSourceType == DataSourceType.authorization) {
      var accessToken = await sharedPreference.getAccessToken();
      headers = {
        "Content-Type": "application/json",
        "Authorization": accessToken ?? "",
      };
    } else {
      headers = {
        "Content-Type": "application/json",
      };
    }
    return headers;
  }

  Future<Map<String, dynamic>> _getResponse(Response<dynamic> response) async {
    if (response.statusCode == 200) {
      final jsonResponse = response.data;
      if (jsonResponse[_statusKey] == _successValue) {
        return jsonResponse;
      } else {
        final error = jsonResponse[_errorValue];
        BaseError baseError = BaseError.fromJson(error);
        String errorString = json.encode(baseError);
        throw ApiServiceManagerException(errorString);
      }
    } else {
      final jsonResponse = response.data;
      final error = jsonResponse[_errorValue];
      BaseError baseError = BaseError.fromJson(error);
      String errorString = json.encode(baseError);
      throw ApiServiceManagerException(errorString);
    }
  }
}

enum DataSourceType {
  unAuthorization,
  authorization,
}

class ApiServiceManagerException extends HttpException {
  ApiServiceManagerException(String message) : super(message);
}
