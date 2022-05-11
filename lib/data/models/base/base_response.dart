import 'package:myfood/data/models/base/base_error.dart';

class BaseResponse<T> {
  String? version;
  String? status;
  BaseError? error;
  T? result;

  BaseResponse({
    this.version,
    this.status,
    this.error,
    this.result,
  });

  BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    version = json['version'];
    status = json['status'];
    error = json['error'] != null ? BaseError.fromJson(json['error']) : null;
    result = json['result'] != null ? fromJsonT(json['result']) : null;
  }

  Map<String, dynamic> toJson(
    dynamic Function(T value) toJsonT,
  ) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['status'] = status;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (result != null) {
      data['result'] = toJsonT(result!);
    }
    return data;
  }
}
