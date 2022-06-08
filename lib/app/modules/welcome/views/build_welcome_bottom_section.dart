import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:myfood/app/modules/welcome/views/build_language_button.dart';
import 'package:myfood/app/modules/welcome/views/build_login_button.dart';
import 'package:myfood/app/modules/welcome/views/build_register_button.dart';
import 'package:myfood/app/modules/welcome/views/build_skip_button.dart';

class BuildWelcomeBottomSection extends GetView<WelcomeController> {
  const BuildWelcomeBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: const [
          BuildLoginButton(),
          SizedBox(height: 16),
          BuildRegisterButton(),
          SizedBox(height: 16),
          BuildSkipButton(),
          SizedBox(height: 16),
          BuildLanguageButton(),
        ],
      ),
    );
  }
}
