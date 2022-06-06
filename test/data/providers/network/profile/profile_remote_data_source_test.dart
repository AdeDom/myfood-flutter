import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
    final baseResponse = {
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
      data: baseResponse,
    );
    final dioAddAuth = MockMyFoodDio();
    when(() => myFoodDio.addAuth()).thenAnswer((_) => dioAddAuth);
    when(() => dioAddAuth.get(path)).thenAnswer((_) async => response);

    final userProfileResponse = await dataSource.callUserProfile();

    UserProfile? result = userProfileResponse.result;
    expect(userProfileResponse.version, "1.0");
    expect(userProfileResponse.status, "success");
    expect(userProfileResponse.error, null);
    expect(result, isNotNull);
    expect(result?.userId, "7e6e4db6a09c43d1a1e3ed8156750e88");
    expect(result?.email, "dom6");
    expect(result?.name, "Change profile");
    expect(result?.mobileNo, "1234567890");
    expect(result?.address, "Phayao");
    expect(result?.image, "https://picsum.photos/300/300");
    expect(result?.status, "active");
    expect(result?.created, "26/3/2022 18:23");
    expect(result?.updated, "10/5/2022 19:5");
    verify(() => dioAddAuth.get(path)).called(1);
  });

  test("callUserProfile_returnError", () async {
    final baseResponse = {
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
      data: baseResponse,
    );
    final dioAddAuth = MockMyFoodDio();
    when(() => myFoodDio.addAuth()).thenAnswer((_) => dioAddAuth);
    when(() => dioAddAuth.get(path)).thenAnswer((_) async => response);

    final userProfileResponse = await dataSource.callUserProfile();

    expect(userProfileResponse.version, "1.0");
    expect(userProfileResponse.status, "error");
    expect(userProfileResponse.error, isNotNull);
    expect(userProfileResponse.error?.code, "error-999");
    expect(userProfileResponse.error?.message, "Api error.");
    expect(userProfileResponse.result, null);
    verify(() => dioAddAuth.get(path)).called(1);
  });
}
