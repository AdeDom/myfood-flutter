import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/token/token.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/store/data_store.dart';
import 'package:myfood/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';

import '../../../mock.dart';
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

  test("callLogin_hasToken_returnSuccess", () async {
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
    ).thenAnswer((_) => Future.value(loginResponse));

    await repository.callLogin(loginRequest: loginRequest);

    expect(dataStore.getAccessToken(), accessToken);
    expect(dataStore.getRefreshToken(), refreshToken);
  });

  test("callLogin_noToken_returnSuccess", () async {
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
    ).thenAnswer((_) => Future.value(loginResponse));

    await repository.callLogin(loginRequest: loginRequest);

    expect(dataStore.getAccessToken(), "");
    expect(dataStore.getRefreshToken(), "");
  });
}
