import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/repositories/auth/auth_repository.dart';
import 'package:myfood/data/repositories/result.dart';
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

    expect(result, const Result.success());
    verify(
      () => authLoginRepository.callLogin(loginRequest: loginRequest),
    ).called(1);
    verify(
      () => authUserProfileRepository.callUserProfile(),
    ).called(1);
  });

  test("callLoginAlreadyToUserProfile_callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final jsonError = {
      "code": "error-999",
      "message": "Api error.",
    };
    when(
      () => authLoginRepository.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer(
      (_) => throw ApiServiceManagerException(
        requestOptions: RequestOptions(path: ""),
        error: json.encode(jsonError),
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

    final objectError = BaseError.fromJson(jsonError);
    expect(result, Result.error(objectError));
    verify(
      () => authLoginRepository.callLogin(loginRequest: loginRequest),
    ).called(1);
    verifyNever(
      () => authUserProfileRepository.callUserProfile(),
    ).called(0);
  });

  test("callLoginAlreadyToUserProfile_callUserProfile_returnError", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final jsonError = {
      "code": "error-999",
      "message": "Api error.",
    };
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
        error: json.encode(jsonError),
      ),
    );

    final result = await repository.callLoginAlreadyToUserProfile(
      loginRequest: loginRequest,
    );

    final objectError = BaseError.fromJson(jsonError);
    expect(result, Result.error(objectError));
    verify(
      () => authLoginRepository.callLogin(loginRequest: loginRequest),
    ).called(1);
    verify(
      () => authUserProfileRepository.callUserProfile(),
    ).called(1);
  });
}
