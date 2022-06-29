import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/models/token/token.dart';
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
  Future<Token?> callLogin({required LoginRequest loginRequest}) async {
    final loginResponse = await authRemoteDataSource.callLogin(
      loginRequest: loginRequest,
    );
    return loginResponse.result;
  }

  @override
  void saveToken({
    required String accessToken,
    required String refreshToken,
  }) {
    dataStore.setAccessToken(accessToken: accessToken);
    dataStore.setRefreshToken(refreshToken: refreshToken);
  }

  @override
  void saveAuthRole() {
    int authRole = AuthRole.auth.name;
    dataStore.setAuthRole(authRole: authRole);
  }
}
