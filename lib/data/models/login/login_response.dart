import 'dart:convert';

import 'package:myfood/data/models/token/token.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.version,
    this.status,
    // required this.error,
    required this.result,
  });

  String? version;
  String? status;

  // Error? error;
  Token? result;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        version: json["version"],
        status: json["status"],
        // error: Error.fromJson(json["error"]),
        result: Token.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "status": status,
        // "error": error?.toJson(),
        "result": result?.toJson(),
      };
}

class Error {
  Error({
    this.code,
    this.message,
  });

  String? code;
  String? message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
