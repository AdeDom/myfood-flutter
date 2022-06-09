import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/login/views/login_page.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
