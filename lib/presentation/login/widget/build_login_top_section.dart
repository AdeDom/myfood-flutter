import 'package:flutter/material.dart';
import 'package:myfood/presentation/login/widget/build_login_form.dart';

class BuildLoginTopSection extends StatelessWidget {
  const BuildLoginTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        _buildLoginTitle(),
        const SizedBox(height: 16),
        _buildLoginSubTitle(),
        const SizedBox(height: 32),
        const BuildLoginForm(),
        const SizedBox(height: 32),
        _buildForgetPasswordButton(),
      ],
    );
  }

  Widget _buildLoginTitle() {
    return const Text(
      "Login",
      style: TextStyle(
        color: Colors.black,
        fontSize: 32,
      ),
    );
  }

  Widget _buildLoginSubTitle() {
    return const Text(
      "Add your details to login",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return const Text(
      "Forget your password?",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}
