import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';

class AuthLoginRepositoryImpl with AuthLoginRepository {
  final DataStore dataStore;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthLoginRepositoryImpl({
    required this.authRemoteDataSource,
    required this.dataStore,
  });

  @override
  Future<void> callAuthLogin({required LoginRequest loginRequest}) async {
    final loginResponse = await authRemoteDataSource.callLogin(
      loginRequest: loginRequest,
    );
    String accessToken = loginResponse.result?.accessToken ?? "";
    String refreshToken = loginResponse.result?.refreshToken ?? "";
    dataStore.setAccessToken(accessToken: accessToken);
    dataStore.setRefreshToken(refreshToken: refreshToken);
  }
}
