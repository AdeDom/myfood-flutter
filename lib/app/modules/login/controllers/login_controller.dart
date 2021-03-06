import 'dart:convert';

import 'package:get/get.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/modules/login/state/login_state.dart';
import 'package:myfood/app/routes/app_pages.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

class LoginController extends GetxController {
  String? _email;
  String? _password;

  final state = const LoginState.initial(isLoginButtonStatus: true).obs;

  final LoginUseCase loginUseCase;

  LoginController({
    required this.loginUseCase,
  });

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
    return loginUseCase.validateEmail(email);
  }

  String? validatePassword(String? password) {
    return loginUseCase.validatePassword(password);
  }

  void callLogin() async {
    try {
      state.value = LoginState.loading(
        isLoginButtonStatus: false,
        email: _email,
        password: _password,
      );
      await loginUseCase(email: _email, password: _password);
      Get.offAllNamed(Routes.HOME);
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      state.value = LoginState.loginError(
        error: baseError,
        isLoginButtonStatus: true,
        email: _email,
        password: _password,
      );
    } catch (error) {
      BaseError baseError = BaseError(
        message: error.toString(),
      );
      state.value = LoginState.loginError(
        error: baseError,
        isLoginButtonStatus: true,
        email: _email,
        password: _password,
      );
    }
  }

  void setCurrentPageState(bool isLoginButtonStatus) {
    state.value = LoginState.currentPage(
      isLoginButtonStatus: isLoginButtonStatus,
      email: _email,
      password: _password,
    );
  }
}
