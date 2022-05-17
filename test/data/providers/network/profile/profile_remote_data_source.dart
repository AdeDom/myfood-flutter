import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';

import '../../../../mock.dart';

void main() {
  late MyFoodDio myFoodDio;
  late ProfileRemoteDataSource dataSource;

  setUp(() {
    myFoodDio = MockMyFoodDio();
    dataSource = ProfileRemoteDataSourceImpl(myFoodDio: myFoodDio);
  });

  tearDown(() {
    myFoodDio.close(force: true);
  });

  test("callUserProfile_returnSuccess", () async {
    String version = "1.0";
    String status = "success";
    BaseError? baseError;
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
    final baseResponse = BaseResponse(
      version: version,
      status: status,
      error: baseError,
      result: userProfile,
    );
    String path = "api/profile/user";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: baseResponse.toJson((value) => value.toJson()),
    );
    final dioAddAuth = MockMyFoodDio();
    when(() => myFoodDio.addAuth()).thenAnswer((_) => dioAddAuth);
    when(() => dioAddAuth.get(path)).thenAnswer((_) => Future.value(response));

    final userProfileResponse = await dataSource.callUserProfile();

    UserProfile? result = userProfileResponse.result;
    expect(userProfileResponse.version, version);
    expect(userProfileResponse.status, status);
    expect(userProfileResponse.error, baseError);
    expect(result, isNotNull);
    expect(result?.userId, userId);
    expect(result?.email, emailResponse);
    expect(result?.name, name);
    expect(result?.mobileNo, mobileNo);
    expect(result?.address, address);
    expect(result?.image, image);
    expect(result?.status, statusResponse);
    expect(result?.created, created);
    expect(result?.updated, updated);
  });

  test("callUserProfile_returnSuccess", () async {
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
    String path = "api/profile/user";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: baseResponse.toJson((value) => result),
    );
    final dioAddAuth = MockMyFoodDio();
    when(() => myFoodDio.addAuth()).thenAnswer((_) => dioAddAuth);
    when(() => dioAddAuth.get(path)).thenAnswer((_) => Future.value(response));

    final userProfileResponse = await dataSource.callUserProfile();

    expect(userProfileResponse.version, version);
    expect(userProfileResponse.status, status);
    expect(userProfileResponse.error, isNotNull);
    expect(userProfileResponse.error?.code, code);
    expect(userProfileResponse.error?.message, message);
    expect(userProfileResponse.result, result);
  });
}
