import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildImageBackground(),
          buildLogoImage(),
        ],
      ),
    );
  }

  Widget buildImageBackground() {
    return const Image(
      image: AssetImage("assets/images/bg.png"),
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget buildLogoImage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_black.png",
            width: 200,
          ),
          Image.asset(
            "assets/images/logo_food_delivery.png",
            width: 110,
          ),
        ],
      ),
    );
  }
}
