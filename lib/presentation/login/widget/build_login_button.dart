import 'package:flutter/material.dart';

class BuildLoginButton extends StatelessWidget {
  const BuildLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLoginButton(context);
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToFoodPage(context);
      },
      child: Container(
        width: 360,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFFFD700),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _navigatorToFoodPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/food", (route) => false);
  }
}
