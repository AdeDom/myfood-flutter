import 'package:myfood/data/models/login/login_request.dart';

abstract class AuthRemoteDataSource {
  Future<bool> callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<bool> callLogin({required LoginRequest loginRequest}) {
    return Future.delayed(
      const Duration(seconds: 2),
      // () => throw const HttpException("Http exception..."),
      () => false,
    );
  }
}
