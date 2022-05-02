import 'dart:io';

import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';
import 'package:myfood/data/source/remote/auth/auth_remote_data_source.dart';
import 'package:myfood/data/source/remote/data_source_provider.dart';

abstract class AuthRepository {
  Future<bool> callLogin({required LoginRequest loginRequest});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<bool> callLogin({required LoginRequest loginRequest}) async {
    try {
      LoginResponse loginResponse =
          await authRemoteDataSource.callLogin(loginRequest: loginRequest);
      return true;
    } on ApiServiceManagerException catch (error) {
      return false;
    } on HttpException catch (error) {
      return false;
    } catch (error) {
      return false;
    }
  }
}
