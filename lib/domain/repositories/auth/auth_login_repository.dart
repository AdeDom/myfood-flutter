import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/models/token/token.dart';

mixin AuthLoginRepository {
  Future<Token?> callLogin({required LoginRequest loginRequest});

  void saveToken({
    required String accessToken,
    required String refreshToken,
  });

  void saveAuthRole();
}
