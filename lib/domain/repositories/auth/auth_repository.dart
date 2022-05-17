import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/repositories/resource.dart';

mixin AuthRepository {
  Future<Resource<bool>> callLogin({required LoginRequest loginRequest});
}
