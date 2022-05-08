import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';
import 'package:myfood/data/providers/network/data_source_provider.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DataSourceProvider dataSourceProvider;

  AuthRemoteDataSourceImpl({required this.dataSourceProvider});

  @override
  Future<LoginResponse> callLogin({required LoginRequest loginRequest}) async {
    final jsonResponse = await dataSourceProvider.httpPost(
      "api/auth/login",
      DataSourceType.unAuthorization,
      body: loginRequest,
    );
    return LoginResponse.fromJson(jsonResponse);
  }
}
