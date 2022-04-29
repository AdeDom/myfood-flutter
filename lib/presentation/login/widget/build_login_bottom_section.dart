import 'package:flutter/material.dart';
import 'package:myfood/presentation/register/register.dart';

class BuildLoginBottomSection extends StatelessWidget {
  const BuildLoginBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLoginBottomSection(context);
  }

  Widget _buildLoginBottomSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigatorToRegisterPage(context);
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

  void _navigatorToRegisterPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }
}
