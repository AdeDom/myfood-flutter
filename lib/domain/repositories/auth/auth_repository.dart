import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/repositories/result.dart';

mixin AuthRepository {
  Future<Result> callLoginAlreadyToUserProfile({
    required LoginRequest loginRequest,
  });

  Future<void> callLogin({required LoginRequest loginRequest});

  Future<void> callUserProfile();
}
