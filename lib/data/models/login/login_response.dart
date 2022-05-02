import 'dart:convert';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/token/token.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.version,
    this.status,
    this.error,
    this.result,
  });

  String? version;
  String? status;
  BaseError? error;
  Token? result;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        version: json["version"],
        status: json["status"],
        error: BaseError.fromJson(json["error"]),
        result: Token.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "status": status,
        "error": error?.toJson(),
        "result": result?.toJson(),
      };
}
