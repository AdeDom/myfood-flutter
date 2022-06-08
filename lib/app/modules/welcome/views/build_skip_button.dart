import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';

class BuildSkipButton extends GetView<WelcomeController> {
  const BuildSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSkipButton(context);
  }

  Widget _buildSkipButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToFoodPage();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Don't want login?",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 4),
          Text(
            "Skip",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFFFD700),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _navigatorToFoodPage() {
    Get.offAllNamed(Routes.HOME);
  }
}