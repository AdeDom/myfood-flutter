import 'dart:convert';
import 'dart:io';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';
import 'package:myfood/data/providers/remote/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/remote/data_source_provider.dart';
import 'package:myfood/data/providers/shared_preference/shared_preference.dart';
import 'package:myfood/data/repositories/resource.dart';

abstract class AuthRepository {
  Future<Resource<bool>> callLogin({required LoginRequest loginRequest});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.sharedPreference,
  });

  AuthRemoteDataSource authRemoteDataSource;
  SharedPreference sharedPreference;

  @override
  Future<Resource<bool>> callLogin({required LoginRequest loginRequest}) async {
    try {
      LoginResponse loginResponse = await authRemoteDataSource.callLogin(
        loginRequest: loginRequest,
      );
      String accessToken = loginResponse.result?.accessToken ?? "";
      String refreshToken = loginResponse.result?.refreshToken ?? "";
      sharedPreference.setAccessToken(accessToken: accessToken);
      sharedPreference.setRefreshToken(refreshToken: refreshToken);
      return Resource(
        isSuccess: true,
        data: true,
      );
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
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
