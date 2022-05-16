import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/store/data_store.dart';

Future<void> addAuth(
  AuthRemoteDataSource authRemoteDataSource,
  DataStore dataStore,
) async {
  String email = "dom6";
  String password = "dom6";
  LoginRequest loginRequest = LoginRequest(
    email: email,
    password: password,
  );
  final loginResponse = await authRemoteDataSource.callLogin(
    loginRequest: loginRequest,
  );
  String accessToken = loginResponse.result?.accessToken ?? "";
  dataStore.setAccessToken(accessToken: accessToken);
}
