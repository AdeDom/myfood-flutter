import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:myfood/app/config/app_constant.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/modules/login/controllers/login_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormBuilderState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Bottom view move on top key board
      body: Column(
        children: [
          _buildLoginTopSection(),
          _buildLoginCenterSection(),
          _buildLoginBottomSection(),
        ],
      ),
    );
  }

  /// BuildLoginTopSection /////////////////////////////////////////////////////
  Widget _buildLoginTopSection() {
    return Column(
      children: [
        const SizedBox(height: 64),
        _buildLoginTitle(),
        const SizedBox(height: 16),
        _buildLoginSubTitle(),
        const SizedBox(height: 32),
        _buildLoginForm(),
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

  Widget _buildLoginForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailTextFormField(),
          const SizedBox(height: 32),
          _buildPasswordTextFormField(),
          const SizedBox(height: 32),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildEmailTextFormField() {
    return SizedBox(
      width: 360,
      child: FormBuilderTextField(
        cursorColor: Colors.grey,
        decoration: _buildInputDecoration(labelText: "Your Email"),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        validator: controller.validateEmail,
        name: AppConstant.emailKey,
        onChanged: controller.setEmail,
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return SizedBox(
      width: 360,
      child: FormBuilderTextField(
        cursorColor: Colors.grey,
        decoration: _buildInputDecoration(labelText: "Password"),
        obscureText: true,
        validator: controller.validatePassword,
        name: AppConstant.passwordKey,
        onChanged: controller.setPassword,
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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      labelText: labelText,
    );
  }

  Widget _buildLoginButton() {
    return Obx(() {
      return GestureDetector(
        onTap: controller.isLoginButtonStatus.value ? _requestLogin : null,
        child: Container(
          width: 360,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: controller.isLoginButtonStatus.value
                ? const Color(0xFFFFD700)
                : Colors.grey,
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
    });
  }

  void _requestLogin() {
    if (_formKey.currentState?.saveAndValidate() == true) {
      _showLoadingDialog();
      controller.callLogin((error) {
        _showErrorDialog(error: error);
      });
    }
  }

  void _showLoadingDialog() {
    Get.defaultDialog(
      title: "Loading",
      barrierDismissible: false,
      onWillPop: () => Future.value(false),
      content: const SizedBox(
        width: 200,
        height: 200,
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Color(0xFFFFD700),
        ),
      ),
    );
  }

  void _showErrorDialog({required BaseError error}) {
    Get.defaultDialog(
      barrierDismissible: false,
      onWillPop: () => Future.value(false),
      title: "Error",
      middleText: error.message ?? "-",
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text("OK"),
        ),
      ],
    );
  }

  /// BuildLoginCenterSection //////////////////////////////////////////////////
  Widget _buildLoginCenterSection() {
    return Expanded(
      child: Container(),
    );
  }

  /// BuildLoginBottomSection //////////////////////////////////////////////////
  Widget _buildLoginBottomSection() {
    return GestureDetector(
      onTap: () {
        Get.offAndToNamed(Routes.REGISTER);
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
}
