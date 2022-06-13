import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/home/views/home_page.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(() {
          return controller.state.value.when(
            initial: () {
              return const HomePage();
            },
            loaded: (foodList) {
              return HomePage(
                foodList: foodList,
              );
            },
          );
        }),
      ),
    );
  }
}
