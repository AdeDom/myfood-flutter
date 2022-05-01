import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/source/remote/auth/auth_remote_data_source.dart';

abstract class AuthRepository {
  Future<bool> callLogin({required LoginRequest loginRequest});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<bool> callLogin({required LoginRequest loginRequest}) async {
    return await authRemoteDataSource.callLogin(loginRequest: loginRequest);
  }
}
