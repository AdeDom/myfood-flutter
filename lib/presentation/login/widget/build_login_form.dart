import 'package:flutter/material.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/repositories/auth/auth_repository.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/data/source/remote/auth/auth_remote_data_source.dart';
import 'package:myfood/data/source/remote/data_source_provider.dart';
import 'package:myfood/domain/usecase/login/login_use_case.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key}) : super(key: key);

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final LoginUseCase _loginUseCase = LoginUseCase(
    authRepository: AuthRepositoryImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        dataSourceProvider: DataSourceProvider(),
      ),
    ),
  );

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  bool _isLoginButtonStatus = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildEmailTextFormField() {
    return SizedBox(
      width: 360,
      child: TextFormField(
        controller: _emailController,
        cursorColor: Colors.grey,
        decoration: _buildInputDecoration(labelText: "Your Email"),
        keyboardType: TextInputType.emailAddress,
        onFieldSubmitted: (value) {
          FocusScope?.of(context).requestFocus(_passwordFocusNode);
        },
        validator: _loginUseCase.validateEmail,
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return SizedBox(
      width: 360,
      child: TextFormField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
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

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: _isLoginButtonStatus ? _requestLogin : null,
      child: Container(
        width: 360,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: _isLoginButtonStatus ? const Color(0xFFFFD700) : Colors.grey,
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

  void _navigatorToFoodPage() {
    Navigator.pushNamedAndRemoveUntil(context, "/food", (route) => false);
  }

  void _requestLogin() {
    if (_formKey.currentState?.validate() == true) {
      _showLoadingDialog();
      _setLoginButton(false);
      String email = _emailController.text;
      String password = _passwordController.text;
      _loginUseCase(email: email, password: password).then(_responseLogin);
    }
  }

  void _responseLogin(Resource resource) {
    Navigator.pop(context);
    _setLoginButton(true);
    if (resource.isSuccess) {
      _navigatorToFoodPage();
    } else {
      _showErrorDialog(error: resource.error);
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          title: Text("Loading"),
          content: SizedBox(
            width: 50,
            height: 200,
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Color(0xFFFFD700),
            ),
          ),
        );
      },
    );
  }

  void _showErrorDialog({required BaseError? error}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(error?.message ?? "-"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _setLoginButton(bool isLoginButtonStatus) {
    setState(() {
      _isLoginButtonStatus = isLoginButtonStatus;
    });
  }
}
