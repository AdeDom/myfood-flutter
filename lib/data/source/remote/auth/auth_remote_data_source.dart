import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginResponse> callLogin({required LoginRequest loginRequest}) async {
    final data = {
      "username": loginRequest.username,
      "password": loginRequest.password,
    };
    var body = json.encode(data);

    final response = await http.post(
      Uri.parse("https://myfood-server.herokuapp.com/api/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(jsonResponse);
      return loginResponse;
    } else {
      throw const HttpException("Api error.");
    }
  }
}
