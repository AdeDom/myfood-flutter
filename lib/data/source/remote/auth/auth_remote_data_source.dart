import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';
import 'package:myfood/data/source/remote/data_source_provider.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.dataSourceProvider});

  DataSourceProvider dataSourceProvider;

  @override
  Future<LoginResponse> callLogin({required LoginRequest loginRequest}) async {
    final jsonResponse = await dataSourceProvider.post(
      "api/auth/login",
      DataSourceType.unAuthorization,
      body: {
        "username": loginRequest.username,
        "password": loginRequest.password,
      },
    );
    return LoginResponse.fromJson(jsonResponse);
  }
}
