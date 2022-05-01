import 'package:flutter/material.dart';
import 'package:myfood/domain/usecase/login/login_use_case.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key}) : super(key: key);

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final LoginUseCase _loginUseCase = LoginUseCase();

  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailTextFormField(),
          const SizedBox(height: 32),
          _buildPasswordTextFormField(),
          const SizedBox(height: 32),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailTextFormField() {
    return SizedBox(
      width: 360,
      child: TextFormField(
        controller: emailController,
        cursorColor: Colors.grey,
        decoration: _buildInputDecoration(labelText: "Your Email"),
        keyboardType: TextInputType.emailAddress,
        validator: _loginUseCase.validateEmail,
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return SizedBox(
      width: 360,
      child: TextFormField(
        controller: passwordController,
        cursorColor: Colors.grey,
        decoration: _buildInputDecoration(labelText: "Password"),
        obscureText: true,
        validator: _loginUseCase.validatePassword,
      ),
    );
  }

  InputDecoration _buildInputDecoration({required String labelText}) {
    return InputDecoration(
      fillColor: Colors.grey.shade200,
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      labelText: labelText,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: onLoginClick,
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

  void onLoginClick() {
    if (_formKey.currentState?.validate() == true) {
      String email = emailController.text;
      String password = passwordController.text;
      _loginUseCase(email: email, password: password);
    }
  }
}
