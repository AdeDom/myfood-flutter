import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/models/token/token.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';

mixin AuthRemoteDataSource {
  Future<BaseResponse<Token>> callLogin({required LoginRequest loginRequest});
}

class AuthRemoteDataSourceImpl with AuthRemoteDataSource {
  final MyFoodDio myFoodDio;

  AuthRemoteDataSourceImpl({required this.myFoodDio});

  @override
  Future<BaseResponse<Token>> callLogin({
    required LoginRequest loginRequest,
  }) async {
    final response = await myFoodDio.post(
      "api/auth/login",
      data: loginRequest,
    );

    return BaseResponse<Token>.fromJson(
      response.data,
      (json) => Token.fromJson(json),
    );
  }
}
