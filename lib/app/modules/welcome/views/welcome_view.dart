import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/views/welcome_page.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomePage(),
    );
  }
}
