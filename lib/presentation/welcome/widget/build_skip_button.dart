import 'package:flutter/material.dart';

class BuildSkipButton extends StatelessWidget {
  const BuildSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSkipButton(context);
  }

  Widget _buildSkipButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToFoodPage(context);
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

  void _navigatorToFoodPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/food", (route) => false);
  }
}
