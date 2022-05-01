import 'package:flutter/material.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key}) : super(key: key);

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEmailTextFormField(),
        const SizedBox(height: 32),
        _buildPasswordTextFormField(),
        const SizedBox(height: 32),
        _buildLoginButton(context),
      ],
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
        controller: emailController,
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
        controller: passwordController,
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

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: onLoginButton,
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

  void onLoginButton() {
    String email = emailController.text;
    String password = passwordController.text;
    print("email : $email, password : $password");
  }
}
