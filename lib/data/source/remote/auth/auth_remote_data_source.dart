import 'package:myfood/data/models/login_request.dart';

abstract class AuthRemoteDataSource {
  bool callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  bool callLogin({required LoginRequest loginRequest}) {
    if (loginRequest.username == "abc" && loginRequest.password == "456") {
      return true;
    }
    return false;
  }
}
