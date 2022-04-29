import 'package:flutter/material.dart';

class BuildLanguageButton extends StatefulWidget {
  const BuildLanguageButton({Key? key}) : super(key: key);

  @override
  State<BuildLanguageButton> createState() => _BuildLanguageButtonState();
}

class _BuildLanguageButtonState extends State<BuildLanguageButton> {
  bool _isLanguageEn = false;

  void setLanguage() {
    setState(() {
      _isLanguageEn = !_isLanguageEn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildLanguageButton();
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
                  SizedBox(
                    height: 4,
                  ),
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
              const SizedBox(
                width: 14,
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 4,
                  ),
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
                      const SizedBox(
                        width: 40,
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "TH",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 4,
                  ),
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
