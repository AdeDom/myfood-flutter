import 'package:myfood/data/models/login_request.dart';

abstract class AuthRemoteDataSource {
  Future callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future callLogin({required LoginRequest loginRequest}) async {
    if (loginRequest.username == "abc" && loginRequest.password == "456") {
      return true;
    }
    return false;
  }
}
