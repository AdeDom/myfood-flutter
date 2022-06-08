import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myfood/app/data/models/base/base_error.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({T? data}) = Success;

  const factory Result.error(BaseError error) = Error;
}
