import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class LoginUseCase {
  final AuthLoginRepository authLoginRepository;
  final AuthUserProfileRepository authUserProfileRepository;

  LoginUseCase({
    required this.authLoginRepository,
    required this.authUserProfileRepository,
  });

  Future<Result> call({
    required String? email,
    required String? password,
  }) async {
    String? validateEmailString = validateEmail(email);
    String? validatePasswordString = validatePassword(password);
    if (validateEmailString != null) {
      BaseError error = BaseError(message: validateEmailString);
      Result resultError = Result.error(error);
      return Future.value(resultError);
    } else if (validatePasswordString != null) {
      BaseError error = BaseError(message: validatePasswordString);
      Result resultError = Result.error(error);
      return Future.value(resultError);
    } else {
      return await callLogin(email, password);
    }
  }

  Future<Result> callLogin(String? email, String? password) async {
    try {
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );
      final token = await authLoginRepository.callLogin(
        loginRequest: loginRequest,
      );
      bool isAccessToken = token?.accessToken?.isNotEmpty ?? false;
      bool isRefreshToken = token?.refreshToken?.isNotEmpty ?? false;
      if (isAccessToken && isRefreshToken) {
        authLoginRepository.saveToken(
          accessToken: token?.accessToken ?? "",
          refreshToken: token?.refreshToken ?? "",
        );
        authLoginRepository.saveAuthRole();

        return await callUserProfile();
      } else {
        throw Exception("Token is null or empty.");
      }
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    } catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.toString());
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    }
  }

  Future<Result> callUserProfile() async {
    final userProfile = await authUserProfileRepository.callUserProfile();
    UserEntity userEntity = UserEntity(
      userId: userProfile?.userId,
      email: userProfile?.email,
      name: userProfile?.name,
      mobileNo: userProfile?.mobileNo,
      address: userProfile?.address,
      image: userProfile?.image,
      status: userProfile?.status,
      created: userProfile?.created,
      updated: userProfile?.updated,
    );
    authUserProfileRepository.saveUser(userEntity);

    return const Result.success();
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "The email is empty";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "The password is empty";
    } else {
      return null;
    }
  }
}
