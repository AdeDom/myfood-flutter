import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/token/token.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';

import '../../../../mock.dart';

void main() {
  late MyFoodDio myFoodDio;
  late AuthRemoteDataSource dataSource;

  setUp(() {
    myFoodDio = MockMyFoodDio();
    dataSource = AuthRemoteDataSourceImpl(myFoodDio: myFoodDio);
  });

  tearDown(() {
    myFoodDio.close(force: true);
  });

  test("callLogin_returnSuccess", () async {
    String email = "dom6";
    String password = "dom6";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final jsonResponse = {
      "version": "1.0",
      "status": "success",
      "result": {
        "accessToken": "abc123",
        "refreshToken": "xyz456",
      }
    };
    String path = "api/auth/login";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: jsonResponse,
    );
    when(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).thenAnswer((_) async => response);

    final login = await dataSource.callLogin(loginRequest: loginRequest);

    final objectResponse = BaseResponse<Token>.fromJson(
      jsonResponse,
      (json) => Token.fromJson(json),
    );
    expect(login.version, objectResponse.version);
    expect(login.status, objectResponse.status);
    expect(login.error, null);
    expect(login.result, isNotNull);
    expect(login.result, objectResponse.result);
    verify(() => myFoodDio.post(path, data: loginRequest)).called(1);
  });

  test("callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom5";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final jsonResponse = {
      "version": "1.0",
      "status": "error",
      "error": {
        "code": "error-999",
        "message": "Api error.",
      }
    };
    String path = "api/auth/login";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: jsonResponse,
    );
    when(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).thenAnswer((_) async => response);

    final login = await dataSource.callLogin(loginRequest: loginRequest);

    final objectResponse = BaseResponse<Token>.fromJson(
      jsonResponse,
      (json) => Token.fromJson(json),
    );
    expect(login.version, objectResponse.version);
    expect(login.status, objectResponse.status);
    expect(login.error, isNotNull);
    expect(login.error, objectResponse.error);
    expect(login.result, null);
    verify(() => myFoodDio.post(path, data: loginRequest)).called(1);
  });
}
