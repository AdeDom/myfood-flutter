import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myfood/data/models/base/base_error.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result.success({dynamic data}) = Success;

  const factory Result.error(BaseError error) = Error;
}
