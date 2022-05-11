import 'package:dio/dio.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/token/token.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<Token>> callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<BaseResponse<Token>> callLogin({
    required LoginRequest loginRequest,
  }) async {
    final _dio = Dio();
    _dio.interceptors.add(ApiServiceManagerInterceptors());
    final response = await _dio.post(
      "api/auth/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: loginRequest,
    );

    return BaseResponse<Token>.fromJson(
      response.data,
      (json) => Token.fromJson(json),
    );
  }
}
