import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/views/welcome_page.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.state.value.when(
          initial: () {
            return WelcomePage();
          },
          changeLanguage: (isLanguageEn) {
            return WelcomePage(isLanguageEn: isLanguageEn);
          },
        );
      }),
    );
  }
}
