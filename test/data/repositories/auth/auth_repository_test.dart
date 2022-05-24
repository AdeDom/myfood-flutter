import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

import '../../../mock.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest());
  });

  late AuthLoginRepository authLoginRepository;
  late AuthUserProfileRepository authUserProfileRepository;
  late AuthRepository repository;

  setUp(() {
    authLoginRepository = MockAuthLoginRepository();
    authUserProfileRepository = MockAuthUserProfileRepository();
    repository = AuthRepositoryImpl(
      authLoginRepository: authLoginRepository,
      authUserProfileRepository: authUserProfileRepository,
    );
  });

  test("callLoginAlreadyToUserProfile_returnSuccess", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    when(
      () => authLoginRepository.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer((_) async {
      return;
    });
    when(
      () => authUserProfileRepository.callUserProfile(),
    ).thenAnswer((_) async {
      return;
    });

    final result = await repository.callLoginAlreadyToUserProfile(
      loginRequest: loginRequest,
    );

    expect(result.isSuccess, true);
    expect(result.error, null);
    expect(result.data, null);
  });

  test("callLoginAlreadyToUserProfile_callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    String code = "APP-999";
    String message = "Api error.";
    BaseError baseError = BaseError(
      code: code,
      message: message,
    );
    String jsonError = jsonEncode(baseError.toJson());
    when(
      () => authLoginRepository.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer(
      (_) => throw ApiServiceManagerException(
        requestOptions: RequestOptions(path: ""),
        error: jsonError,
      ),
    );
    when(
      () => authUserProfileRepository.callUserProfile(),
    ).thenAnswer((_) async {
      return;
    });

    final result = await repository.callLoginAlreadyToUserProfile(
      loginRequest: loginRequest,
    );

    expect(result.isSuccess, false);
    expect(result.error?.code, code);
    expect(result.error?.message, message);
    expect(result.data, null);
  });

  test("callLoginAlreadyToUserProfile_callUserProfile_returnError", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    String code = "APP-999";
    String message = "Api error.";
    BaseError baseError = BaseError(
      code: code,
      message: message,
    );
    String jsonError = jsonEncode(baseError.toJson());
    when(
      () => authLoginRepository.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer((_) async {
      return;
    });
    when(
      () => authUserProfileRepository.callUserProfile(),
    ).thenAnswer(
      (_) => throw ApiServiceManagerException(
        requestOptions: RequestOptions(path: ""),
        error: jsonError,
      ),
    );

    final result = await repository.callLoginAlreadyToUserProfile(
      loginRequest: loginRequest,
    );

    expect(result.isSuccess, false);
    expect(result.error?.code, code);
    expect(result.error?.message, message);
    expect(result.data, null);
  });
}
