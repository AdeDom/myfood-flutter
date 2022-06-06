import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
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
    BaseError? baseError;
    final baseResponse = {
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
      data: baseResponse,
    );
    when(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).thenAnswer((_) async => response);

    final login = await dataSource.callLogin(loginRequest: loginRequest);

    expect(login.version, "1.0");
    expect(login.status, "success");
    expect(login.error, baseError);
    expect(login.result, isNotNull);
    expect(login.result?.accessToken, "abc123");
    expect(login.result?.refreshToken, "xyz456");
    verify(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).called(1);
  });

  test("callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom5";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final baseResponse = {
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
      data: baseResponse,
    );
    when(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).thenAnswer((_) async => response);

    final login = await dataSource.callLogin(loginRequest: loginRequest);

    expect(login.version, "1.0");
    expect(login.status, "error");
    expect(login.error, isNotNull);
    expect(login.error?.code, "error-999");
    expect(login.error?.message, "Api error.");
    expect(login.result, null);
    verify(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).called(1);
  });
}
