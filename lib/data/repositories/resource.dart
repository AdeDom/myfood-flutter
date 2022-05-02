import 'package:myfood/data/models/base/base_error.dart';

class Resource<T> {
  Resource({
    this.isSuccess = false,
    this.error,
    this.data,
  });

  bool isSuccess;
  BaseError? error;
  T? data;
}
