import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';
import 'package:myfood/generated/locales.g.dart';

class WelcomePage extends GetView<WelcomeController> {
  bool? isLanguageEn;

  WelcomePage({
    Key? key,
    this.isLanguageEn,
  }) : super(key: key);

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
        Get.toNamed(Routes.LOGIN);
      },
      child: Container(
        width: 360,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFFFD700),
        ),
        child: Center(
          child: Text(
            LocaleKeys.login.tr,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.REGISTER);
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
        child: Center(
          child: Text(
            LocaleKeys.create_an_account.tr,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return GestureDetector(
      onTap: () {
        controller.setRoleGuest();
        Get.offAllNamed(Routes.HOME);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.don_t_want_login.tr,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            LocaleKeys.skip.tr,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFFFFD700),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton() {
    if (isLanguageEn ?? false) {
      return _buildLanguageEnButton();
    } else {
      return _buildLanguageThButton();
    }
  }

  Widget _buildLanguageThButton() {
    return GestureDetector(
      onTap: controller.setLanguage,
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
      onTap: controller.setLanguage,
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
}
