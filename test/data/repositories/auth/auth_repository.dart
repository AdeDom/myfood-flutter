import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/token/token.dart';
import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/data/providers/store/data_store.dart';
import 'package:myfood/data/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';

import '../../providers/database/user/user_local_data_source.dart';
import '../../providers/store/data_store.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockProfileRemoteDataSource extends Mock implements ProfileRemoteDataSource {}

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest());
  });

  late UserLocalDataSource userLocalDataSource;
  late AuthRemoteDataSource authRemoteDataSource;
  late ProfileRemoteDataSource profileRemoteDataSource;
  late DataStore dataStore;
  late AuthRepository repository;

  setUp(() {
    userLocalDataSource = FakeUserLocalDataSource();
    authRemoteDataSource = MockAuthRemoteDataSource();
    profileRemoteDataSource = MockProfileRemoteDataSource();
    dataStore = FakeDataStoreImpl();
    repository = AuthRepositoryImpl(
      userLocalDataSource: userLocalDataSource,
      authRemoteDataSource: authRemoteDataSource,
      profileRemoteDataSource: profileRemoteDataSource,
      dataStore: dataStore,
    );
  });

  test("callLogin_returnSuccess", () async {
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    String version = "1.0";
    String status = "success";
    Token token = Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    final loginResponse = BaseResponse(
      version: version,
      status: status,
      result: token,
    );
    String userId = "aaa";
    String emailResponse = "bbb";
    String name = "ccc";
    String mobileNo = "ddd";
    String address = "eee";
    String image = "fff";
    String statusResponse = "ggg";
    String created = "hhh";
    String updated = "iii";
    UserProfile userProfile = UserProfile(
      userId: userId,
      email: emailResponse,
      name: name,
      mobileNo: mobileNo,
      address: address,
      image: image,
      status: statusResponse,
      created: created,
      updated: updated,
    );
    final userProfileResponse = BaseResponse(
      version: version,
      status: status,
      result: userProfile,
    );
    when(
      () => authRemoteDataSource.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer((_) => Future.value(loginResponse));
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) => Future.value(userProfileResponse));

    final result = await repository.callLogin(loginRequest: loginRequest);

    expect(result.isSuccess, true);
    expect(result.data, true);
    expect(dataStore.getAccessToken(), accessToken);
    expect(dataStore.getRefreshToken(), refreshToken);
    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.userId, userId);
    expect(userEntity?.email, emailResponse);
    expect(userEntity?.name, name);
    expect(userEntity?.mobileNo, mobileNo);
    expect(userEntity?.address, address);
    expect(userEntity?.image, image);
    expect(userEntity?.status, statusResponse);
    expect(userEntity?.created, created);
    expect(userEntity?.updated, updated);
  });

  test("callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    var messageError = "Api error.";
    BaseError baseError = BaseError(message: messageError);
    String jsonError = jsonEncode(baseError.toJson());
    String errorString = jsonError;
    when(
      () => authRemoteDataSource.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer(
      (_) => throw ApiServiceManagerException(
        requestOptions: RequestOptions(path: ""),
        error: errorString,
      ),
    );

    final result = await repository.callLogin(loginRequest: loginRequest);

    BaseError? errorResponse = result.error;
    expect(errorResponse?.code, null);
    expect(errorResponse?.message, messageError);
  });
}
