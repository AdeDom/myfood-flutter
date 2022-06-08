import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/login/views/build_login_bottom_section.dart';
import 'package:myfood/app/modules/login/views/build_login_center_section.dart';
import 'package:myfood/app/modules/login/views/build_login_top_section.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Bottom view move on top key board
      body: Column(
        children: const [
          BuildLoginTopSection(),
          BuildLoginCenterSection(),
          BuildLoginBottomSection(),
        ],
      ),
    );
  }
}
