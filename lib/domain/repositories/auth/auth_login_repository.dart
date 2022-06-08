import 'package:myfood/app/data/models/login/login_request.dart';

mixin AuthLoginRepository {
  Future<void> callLogin({required LoginRequest loginRequest});
}
