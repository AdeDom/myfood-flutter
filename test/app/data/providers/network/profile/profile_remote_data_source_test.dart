import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/user_profile/user_profile.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';

import '../../../../../mock.dart';

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
    final jsonResponse = {
      "version": "1.0",
      "status": "success",
      "result": {
        "userId": "7e6e4db6a09c43d1a1e3ed8156750e88",
        "email": "dom6",
        "name": "Change profile",
        "mobileNo": "1234567890",
        "address": "Phayao",
        "image": "https://picsum.photos/300/300",
        "status": "active",
        "created": "26/3/2022 18:23",
        "updated": "10/5/2022 19:5",
      }
    };
    String path = "api/profile/user";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: jsonResponse,
    );
    final dioAddAuth = MockMyFoodDio();
    when(() => myFoodDio.addAuth()).thenAnswer((_) => dioAddAuth);
    when(() => dioAddAuth.get(path)).thenAnswer((_) async => response);

    final userProfileResponse = await dataSource.callUserProfile();

    final objectResponse = BaseResponse<UserProfile>.fromJson(
      jsonResponse,
      (json) => UserProfile.fromJson(json),
    );
    expect(userProfileResponse.version, objectResponse.version);
    expect(userProfileResponse.status, objectResponse.status);
    expect(userProfileResponse.error, null);
    expect(userProfileResponse.result, isNotNull);
    expect(userProfileResponse.result, objectResponse.result);
    verify(() => dioAddAuth.get(path)).called(1);
  });

  test("callUserProfile_returnError", () async {
    final jsonResponse = {
      "version": "1.0",
      "status": "error",
      "error": {
        "code": "error-999",
        "message": "Api error.",
      }
    };
    String path = "api/profile/user";
    RequestOptions requestOptions = RequestOptions(path: path);
    Response response = Response(
      requestOptions: requestOptions,
      data: jsonResponse,
    );
    final dioAddAuth = MockMyFoodDio();
    when(() => myFoodDio.addAuth()).thenAnswer((_) => dioAddAuth);
    when(() => dioAddAuth.get(path)).thenAnswer((_) async => response);

    final userProfileResponse = await dataSource.callUserProfile();

    final objectResponse = BaseResponse<UserProfile>.fromJson(
      jsonResponse,
      (json) => UserProfile.fromJson(json),
    );
    expect(userProfileResponse.version, objectResponse.version);
    expect(userProfileResponse.status, objectResponse.status);
    expect(userProfileResponse.error, isNotNull);
    expect(userProfileResponse.error, objectResponse.error);
    expect(userProfileResponse.result, null);
    verify(() => dioAddAuth.get(path)).called(1);
  });
}
