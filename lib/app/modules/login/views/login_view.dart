import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/dialog/error_dialog.dart';
import 'package:myfood/app/modules/dialog/loading_dialog.dart';
import 'package:myfood/app/modules/login/views/login_page.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Bottom view move on top key board
      body: Obx(() {
        return controller.state.value.when(
          initial: (isLoginButtonStatus) {
            return LoginPage(isLoginButtonStatus: isLoginButtonStatus);
          },
          loading: (isLoginButtonStatus, email, password) {
            return Stack(
              children: [
                LoginPage(
                  isLoginButtonStatus: isLoginButtonStatus,
                  email: email,
                  password: password,
                ),
                const LoadingDialog(),
              ],
            );
          },
          loginError: (error, isLoginButtonStatus, email, password) {
            return Stack(
              children: [
                LoginPage(
                  isLoginButtonStatus: isLoginButtonStatus,
                  email: email,
                  password: password,
                ),
                ErrorDialog(
                  baseError: error,
                  onPressed: () {
                    controller.setCurrentPageState(isLoginButtonStatus);
                  },
                ),
              ],
            );
          },
          currentPage: (isLoginButtonStatus, email, password) {
            return LoginPage(
              isLoginButtonStatus: isLoginButtonStatus,
              email: email,
              password: password,
            );
          },
        );
      }),
    );
  }
}
