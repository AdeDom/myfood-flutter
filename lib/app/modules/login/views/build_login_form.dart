import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:myfood/app/config/app_constant.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/app/routes/app_pages.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key}) : super(key: key);

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final LoginUseCase _loginUseCase = LoginUseCase(
    authRepository: AuthRepositoryImpl(
      authLoginRepository: AuthLoginRepositoryImpl(
        authRemoteDataSource: AuthRemoteDataSourceImpl(
          myFoodDio: MyFoodDio(
            dataStore: DataStoreImpl(),
          ),
        ),
        dataStore: DataStoreImpl(),
      ),
      authUserProfileRepository: AuthUserProfileRepositoryImpl(
        userLocalDataSource: UserLocalDataSourceImpl(),
        profileRemoteDataSource: ProfileRemoteDataSourceImpl(
          myFoodDio: MyFoodDio(
            dataStore: DataStoreImpl(),
          ),
        ),
      ),
    ),
  );

  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoginButtonStatus = true;

  @override
  Widget build(BuildContext context) {
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
        validator: _loginUseCase.validateEmail,
        name: AppConstant.emailKey,
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
        validator: _loginUseCase.validatePassword,
        name: AppConstant.passwordKey,
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
    Get.offAllNamed(Routes.HOME);
  }

  void _requestLogin() {
    if (_formKey.currentState?.saveAndValidate() == true) {
      _showLoadingDialog();
      _setLoginButton(false);
      final formData = _formKey.currentState?.value ?? <String, dynamic>{};
      final email = formData[(AppConstant.emailKey)];
      final password = formData[(AppConstant.passwordKey)];
      _loginUseCase(email: email, password: password).then(_responseLogin);
    }
  }

  void _responseLogin(Result result) {
    Get.back();
    _setLoginButton(true);
    result.when(
      success: (data) {
        _navigatorToFoodPage();
      },
      error: (error) {
        _showErrorDialog(error: error);
      },
    );
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

  void _setLoginButton(bool isLoginButtonStatus) {
    setState(() {
      _isLoginButtonStatus = isLoginButtonStatus;
    });
  }
}
