import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/home/views/home_page.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
