import 'package:flutter/material.dart';
import 'package:myfood/presentation/login/widget/build_login_button.dart';

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
        _buildEmailTextFormField(),
        const SizedBox(height: 32),
        _buildPasswordTextFormField(),
        const SizedBox(height: 32),
        const BuildLoginButton(),
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

  Widget _buildEmailTextFormField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          )),
      width: 360,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          labelText: "Your Email",
        ),
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          )),
      width: 360,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          labelText: "Password",
        ),
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
