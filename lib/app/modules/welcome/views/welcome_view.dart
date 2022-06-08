import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/views/build_welcome_bottom_section.dart';
import 'package:myfood/app/modules/welcome/views/build_welcome_center_section.dart';
import 'package:myfood/app/modules/welcome/views/build_welcome_top_section.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          BuildWelcomeTopSection(),
          BuildWelcomeCenterSection(),
          BuildWelcomeBottomSection(),
        ],
      ),
    );
  }
}
