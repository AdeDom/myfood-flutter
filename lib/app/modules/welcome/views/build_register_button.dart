import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/controllers/welcome_controller.dart';

class BuildRegisterButton extends GetView<WelcomeController> {
  const BuildRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToRegisterPage(context);
      },
      child: Container(
        width: 360,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: const Color(0xFFFFD700),
          ),
        ),
        child: const Center(
          child: Text(
            "Create an Account",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _navigatorToRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }
}
