import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/providers/shared_preference/shared_preference.dart';

class DataSourceProvider {
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
    final response = http.get(
      Uri.parse("$_baseUrl$path"),
      headers: await _getHeaders(dataSourceType),
    );

    return await _getResponse(response);
  }

  Future<Map<String, dynamic>> httpPost(
    String path,
    DataSourceType dataSourceType, {
    Object? body,
  }) async {
    final response = http.post(
      Uri.parse("$_baseUrl$path"),
      headers: await _getHeaders(dataSourceType),
      body: json.encode(body),
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

  Future<Map<String, dynamic>> _getResponse(Future<Response> response) async {
    final _response = await response;
    if (_response.statusCode == 200) {
      final jsonResponse = json.decode(_response.body);
      if (jsonResponse[_statusKey] == _successValue) {
        return jsonResponse;
      } else {
        final error = jsonResponse[_errorValue];
        BaseError baseError = BaseError.fromJson(error);
        String errorString = json.encode(baseError);
        throw ApiServiceManagerException(errorString);
      }
    } else {
      final jsonResponse = json.decode(_response.body);
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
