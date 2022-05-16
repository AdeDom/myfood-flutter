import 'package:flutter_test/flutter_test.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/data/providers/store/data_store.dart';

import '../../store/data_store.dart';
import '../add_auth.dart';

void main() {
  late DataStore dataStore;
  late MyFoodDio myFoodDio;
  late AuthRemoteDataSource authRemoteDataSource;
  late ProfileRemoteDataSource dataSource;

  setUp(() {
    dataStore = FakeDataStoreImpl();
    myFoodDio = MyFoodDio(dataStore: dataStore);
    authRemoteDataSource = AuthRemoteDataSourceImpl(myFoodDio: myFoodDio);
    dataSource = ProfileRemoteDataSourceImpl(myFoodDio: myFoodDio);
  });

  tearDown(() {
    myFoodDio.close(force: true);
  });

  test("callUserProfile_returnSuccess", () async {
    await addAuth(authRemoteDataSource, dataStore);

    final userProfile = await dataSource.callUserProfile();

    String? result = userProfile.result?.userId;
    expect(result, isNotNull);
    expect(result, "7e6e4db6a09c43d1a1e3ed8156750e88");
  });

  test("callUserProfile_returnSuccess", () async {
    try {
      await dataSource.callUserProfile();
    } on ApiServiceManagerException catch (error) {
      String messageError = """
            {"code":"401","message":"Unauthorized."}
            """
          .trim();
      expect(error.message, messageError);
    }
  });
}
