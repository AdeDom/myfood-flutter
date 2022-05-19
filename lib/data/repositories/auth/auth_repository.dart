import 'dart:convert';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLoginRepository authLoginRepository;
  final AuthUserProfileRepository authUserProfileRepository;

  AuthRepositoryImpl({
    required this.authLoginRepository,
    required this.authUserProfileRepository,
  });

  @override
  Future<Resource<Object>> callLogin({
    required LoginRequest loginRequest,
  }) async {
    try {
      await authLoginRepository.callLogin(loginRequest: loginRequest);

      await authUserProfileRepository.callUserProfile();

      return Resource.success(data: null);
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Resource.error(error: baseError);
    } catch (error) {
      BaseError baseError = BaseError(message: error.toString());
      return Resource.error(error: baseError);
    }
  }
}
