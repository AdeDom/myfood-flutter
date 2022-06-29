import 'package:get/get.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    AuthLoginRepository authLoginRepository = Get.find();
    LoginUseCase loginUseCase = LoginUseCase(
      authLoginRepository: authLoginRepository,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(loginUseCase: loginUseCase),
    );
  }
}
