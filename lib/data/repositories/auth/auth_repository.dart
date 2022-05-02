import 'dart:io';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/data/source/remote/auth/auth_remote_data_source.dart';
import 'package:myfood/data/source/remote/data_source_provider.dart';

abstract class AuthRepository {
  Future<Resource<bool>> callLogin({required LoginRequest loginRequest});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Resource<bool>> callLogin({required LoginRequest loginRequest}) async {
    try {
      LoginResponse loginResponse =
          await authRemoteDataSource.callLogin(loginRequest: loginRequest);
      return Resource(
        isSuccess: true,
        data: true,
      );
    } on ApiServiceManagerException catch (error) {
      BaseError baseError = BaseError(message: "Hello, error.");
      return Resource(error: baseError);
    } on HttpException catch (error) {
      BaseError baseError = BaseError(message: error.message);
      return Resource(error: baseError);
    } catch (error) {
      BaseError baseError = BaseError(message: error.toString());
      return Resource(error: baseError);
    }
  }
}
