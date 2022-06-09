import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';

class WelcomePage extends GetView<WelcomeController> {
  bool _isLanguageEn = false;
  final DataStore dataStore = DataStoreImpl();

  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWelcomeTopSection(),
        _buildWelcomeCenterSection(),
        _buildWelcomeBottomSection(),
      ],
    );
  }

  /// BuildWelcomeTopSection ///////////////////////////////////////////////////
  Widget _buildWelcomeTopSection() {
    return Expanded(
      flex: 6,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 5,
                  blurRadius: 10,
                )
              ],
            ),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              child: Image(
                image: AssetImage("assets/images/bg_welcome.png"),
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo_black.png",
                  width: 200,
                ),
                Image.asset(
                  "assets/images/logo_food_delivery.png",
                  width: 110,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// BuildWelcomeCenterSection ////////////////////////////////////////////////
  Widget _buildWelcomeCenterSection() {
    return Expanded(
      flex: 3,
      child: Container(),
    );
  }

  /// BuildWelcomeBottomSection ////////////////////////////////////////////////
  Widget _buildWelcomeBottomSection() {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          _buildLoginButton(),
          const SizedBox(height: 16),
          _buildRegisterButton(),
          const SizedBox(height: 16),
          _buildSkipButton(),
          const SizedBox(height: 16),
          _buildLanguageButton(),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: () {
        _navigatorToLoginPage();
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

  void _navigatorToLoginPage() {
    Get.toNamed(Routes.LOGIN);
  }

  Widget _buildRegisterButton() {
    return GestureDetector(
      onTap: () {
        _navigatorToRegisterPage();
      },
      child: Container(
        width: 360,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: const Color(0xFFFFD700),
          ),
        ),
        child: const Center(
          child: Text(
            "Create an Account",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _navigatorToRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }

  Widget _buildSkipButton() {
    return GestureDetector(
      onTap: () {
        _navigatorToFoodPage();
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

  void _navigatorToFoodPage() {
    Get.offAllNamed(Routes.HOME);
  }

  Widget _buildLanguageButton() {
    if (_isLanguageEn) {
      return _buildLanguageEnButton();
    } else {
      return _buildLanguageThButton();
    }
  }

  Widget _buildLanguageThButton() {
    return GestureDetector(
      onTap: setLanguage,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFFFD700),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFFFD700),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  SizedBox(height: 4),
                  Text(
                    "TH",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Column(
                children: const [
                  SizedBox(height: 4),
                  Text(
                    "EN",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageEnButton() {
    return GestureDetector(
      onTap: setLanguage,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFFFD700),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFFFFD700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  SizedBox(height: 4),
                  Text(
                    "TH",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Column(
                children: const [
                  SizedBox(height: 4),
                  Text(
                    "EN",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void setLanguage() {
    dataStore.setIsLanguageEn(isLanguageEn: !_isLanguageEn);
    _isLanguageEn = !_isLanguageEn;
  }
}
