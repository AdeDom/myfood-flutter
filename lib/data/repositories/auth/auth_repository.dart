import 'package:myfood/data/models/login_request.dart';
import 'package:myfood/data/source/remote/auth/auth_remote_data_source.dart';

abstract class AuthRepository {
  Future callLogin({required LoginRequest loginRequest});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future callLogin({required LoginRequest loginRequest}) {
    return authRemoteDataSource.callLogin(loginRequest: loginRequest);
  }
}
