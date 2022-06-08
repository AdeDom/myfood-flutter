import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/register/controllers/register_controller.dart';

class BuildAlreadyHaveAccount extends GetView<RegisterController> {
  const BuildAlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildAlreadyHaveAccount(context);
  }

  Widget _buildAlreadyHaveAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToLoginPage(context);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Already have an Account?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "Login",
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

  void _navigatorToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
}
