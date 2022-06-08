import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/login/controllers/login_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';

class BuildLoginBottomSection extends GetView<LoginController> {
  const BuildLoginBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLoginBottomSection(context);
  }

  Widget _buildLoginBottomSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToRegisterPage();
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Don't have an Account?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFD700),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _navigatorToRegisterPage() {
    Get.offAndToNamed(Routes.REGISTER);
  }
}
