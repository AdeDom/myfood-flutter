import 'package:flutter_test/flutter_test.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/store/store.dart';

import '../../../provider/store/store.dart';

void main() {
  late Store store;
  late MyFoodDio myFoodDio;
  late AuthRemoteDataSource dataSource;

  setUp(() {
    store = FakeStoreImpl();
    myFoodDio = MyFoodDio(store: store);
    dataSource = AuthRemoteDataSourceImpl(myFoodDio: myFoodDio);
  });

  tearDown(() {
    myFoodDio.close(force: true);
  });

  group("AuthRemoteDataSource", () {
    test("callLogin_returnSuccess", () async {
      String email = "dom6";
      String password = "dom6";
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );

      final login = await dataSource.callLogin(loginRequest: loginRequest);

      expect(login.version, "1.0");
      expect(login.status, "success");
      expect(login.error, null);
      expect(login.result, isNotNull);
    });

    test("callLogin_returnError", () async {
      String email = "dom6";
      String password = "dom5";
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );

      try {
        await dataSource.callLogin(loginRequest: loginRequest);
      } on ApiServiceManagerException catch (error) {
        String messageError = """
        {"message":"Email or password incorrect."}
        """
            .trim();
        expect(error.message, messageError);
      }
    });
  });
}
