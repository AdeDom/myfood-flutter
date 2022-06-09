import 'package:get/get.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/app/routes/app_pages.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

class LoginController extends GetxController {
  String? _email = "";
  String? _password = "";
  final isLoginButtonStatus = true.obs;

  final LoginUseCase _loginUseCase = LoginUseCase(
    authRepository: AuthRepositoryImpl(
      authLoginRepository: AuthLoginRepositoryImpl(
        authRemoteDataSource: AuthRemoteDataSourceImpl(
          myFoodDio: MyFoodDio(
            dataStore: DataStoreImpl(),
          ),
        ),
        dataStore: DataStoreImpl(),
      ),
      authUserProfileRepository: AuthUserProfileRepositoryImpl(
        userLocalDataSource: UserLocalDataSourceImpl(),
        profileRemoteDataSource: ProfileRemoteDataSourceImpl(
          myFoodDio: MyFoodDio(
            dataStore: DataStoreImpl(),
          ),
        ),
      ),
    ),
  );

  void setEmail(String? email) {
    _email = email;
  }

  String? getEmail() {
    return _email;
  }

  void setPassword(String? password) {
    _password = password;
  }

  String? getPassword() {
    return _password;
  }

  String? validateEmail(String? email) {
    return _loginUseCase.validateEmail(email);
  }

  String? validatePassword(String? password) {
    return _loginUseCase.validatePassword(password);
  }

  void callLogin(Function(BaseError) baseError) {
    isLoginButtonStatus.value = false;
    _loginUseCase(email: _email, password: _password).then((result) {
      result.when(
        success: (_) {
          Get.back();
          isLoginButtonStatus.value = true;
          Get.offAllNamed(Routes.HOME);
        },
        error: (error) {
          Get.back();
          isLoginButtonStatus.value = true;
          baseError(error);
        },
      );
    });
  }
}
