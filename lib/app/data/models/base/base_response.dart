import 'package:json_annotation/json_annotation.dart';
import 'package:myfood/app/data/models/base/base_error.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
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

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(dynamic Function(T value) toJsonT) {
    return _$BaseResponseToJson(this, toJsonT);
  }
}
