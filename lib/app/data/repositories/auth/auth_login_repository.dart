import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';

class AuthLoginRepositoryImpl with AuthLoginRepository {
  final DataStore dataStore;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthLoginRepositoryImpl({
    required this.authRemoteDataSource,
    required this.dataStore,
  });

  @override
  Future<void> callLogin({required LoginRequest loginRequest}) async {
    final loginResponse = await authRemoteDataSource.callLogin(
      loginRequest: loginRequest,
    );
    String accessToken = loginResponse.result?.accessToken ?? "";
    String refreshToken = loginResponse.result?.refreshToken ?? "";
    dataStore.setAccessToken(accessToken: accessToken);
    dataStore.setRefreshToken(refreshToken: refreshToken);
    bool isAuthRole = accessToken.isNotEmpty && refreshToken.isNotEmpty;
    if (isAuthRole) {
      int authRole = AuthRole.auth.name;
      dataStore.setAuthRole(authRole: authRole);
    }
  }
}
