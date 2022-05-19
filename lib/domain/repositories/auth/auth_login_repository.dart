import 'package:myfood/data/models/login/login_request.dart';

mixin AuthLoginRepository {
  Future<void> callLogin({required LoginRequest loginRequest});
}
