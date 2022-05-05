import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/token/token.dart';

class LoginResponse {
  String? version;
  String? status;
  BaseError? error;
  Token? result;

  LoginResponse({
    this.version,
    this.status,
    this.error,
    this.result,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    status = json['status'];
    error = json['error'] != null ? BaseError.fromJson(json['error']) : null;
    result = json['result'] != null ? Token.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['status'] = status;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}
