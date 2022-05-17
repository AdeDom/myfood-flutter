import 'package:myfood/data/models/base/base_error.dart';

class Resource<T> {
  Resource({
    this.isSuccess = false,
    this.error,
    this.data,
  });

  Resource.success({required this.data})
      : isSuccess = true,
        error = null;

  Resource.error({required this.error})
      : isSuccess = false,
        data = null;

  bool isSuccess;
  BaseError? error;
  T? data;
}
