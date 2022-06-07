import 'dart:convert';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/repositories/result.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class AuthRepositoryImpl with AuthRepository {
  final AuthLoginRepository authLoginRepository;
  final AuthUserProfileRepository authUserProfileRepository;

  AuthRepositoryImpl({
    required this.authLoginRepository,
    required this.authUserProfileRepository,
  });

  @override
  Future<Result> callLoginAlreadyToUserProfile({
    required LoginRequest loginRequest,
  }) async {
    try {
      await authLoginRepository.callLogin(loginRequest: loginRequest);

      await authUserProfileRepository.callUserProfile();

      return const Result.success();
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    } catch (error) {
      BaseError baseError = BaseError(message: error.toString());
      return Result.error(baseError);
    }
  }

  @override
  Future<void> callUserProfile() {
    return authUserProfileRepository.callUserProfile();
  }

  @override
  Future<void> callLogin({required LoginRequest loginRequest}) {
    return authLoginRepository.callLogin(loginRequest: loginRequest);
  }
}
