import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/models/token/token.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';

import '../../../../mock.dart';
import '../../providers/store/data_store.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest());
  });

  late AuthRemoteDataSource authRemoteDataSource;
  late DataStore dataStore;
  late AuthLoginRepository repository;

  setUp(() {
    authRemoteDataSource = MockAuthRemoteDataSource();
    dataStore = FakeDataStoreImpl();
    repository = AuthLoginRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
      dataStore: dataStore,
    );
  });

  test("callLogin_returnHaveToken", () async {
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    Token token = Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    final loginResponse = BaseResponse(result: token);
    when(
      () => authRemoteDataSource.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer((_) async => loginResponse);

    final result = await repository.callLogin(loginRequest: loginRequest);

    expect(result, token);
    verify(
      () => authRemoteDataSource.callLogin(
        loginRequest: loginRequest,
      ),
    ).called(1);
  });

  test("callLogin_returnTokenIsNull", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final loginResponse = BaseResponse<Token>();
    when(
      () => authRemoteDataSource.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer((_) async => loginResponse);

    final result = await repository.callLogin(loginRequest: loginRequest);

    expect(result, null);
    verify(
      () => authRemoteDataSource.callLogin(
        loginRequest: loginRequest,
      ),
    ).called(1);
  });

  test("saveToken_returnToken", () async {
    String accessToken = "abc";
    String refreshToken = "xyz";

    repository.saveToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );

    expect(dataStore.getAccessToken(), accessToken);
    expect(dataStore.getRefreshToken(), refreshToken);
  });

  test("saveAuthRole_returnAuthRole", () async {
    repository.saveAuthRole();

    expect(dataStore.getAuthRole(), AuthRole.auth.name);
  });
}
