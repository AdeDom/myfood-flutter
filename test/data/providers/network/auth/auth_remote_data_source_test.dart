import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
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
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    Token token = Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    String version = "1.0";
    String status = "success";
    BaseError? baseError;
    final baseResponse = BaseResponse(
      version: version,
      status: status,
      error: baseError,
      result: token,
    );
    String path = "api/auth/login";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: baseResponse.toJson((value) => value.toJson()),
    );
    when(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).thenAnswer((_) => Future.value(response));

    final login = await dataSource.callLogin(loginRequest: loginRequest);

    expect(login.version, version);
    expect(login.status, status);
    expect(login.error, baseError);
    expect(login.result, isNotNull);
    expect(login.result?.accessToken, accessToken);
    expect(login.result?.refreshToken, refreshToken);
  });

  test("callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom5";
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    String version = "1.0";
    String status = "success";
    String code = "error-999";
    String message = "Api error.";
    BaseError? baseError = BaseError(
      code: code,
      message: message,
    );
    Object? result;
    final baseResponse = BaseResponse(
      version: version,
      status: status,
      error: baseError,
      result: result,
    );
    String path = "api/auth/login";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: baseResponse.toJson((value) => result),
    );
    when(
      () => myFoodDio.post(
        path,
        data: loginRequest,
      ),
    ).thenAnswer((_) => Future.value(response));

    final login = await dataSource.callLogin(loginRequest: loginRequest);

    expect(login.version, version);
    expect(login.status, status);
    expect(login.error, isNotNull);
    expect(login.error?.code, code);
    expect(login.error?.message, message);
    expect(login.result, result);
  });
}
