import 'package:flutter/material.dart';
import 'package:myfood/presentation/welcome/widget/BuildLanguageButton.dart';
import 'package:myfood/presentation/welcome/widget/BuildLoginButton.dart';
import 'package:myfood/presentation/welcome/widget/BuildRegisterButton.dart';
import 'package:myfood/presentation/welcome/widget/BuildSkipButton.dart';

class BuildWelcomeBottomSection extends StatelessWidget {
  const BuildWelcomeBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: const [
          BuildLoginButton(),
          SizedBox(
            height: 16,
          ),
          BuildRegisterButton(),
          SizedBox(
            height: 16,
          ),
          BuildSkipButton(),
          SizedBox(
            height: 16,
          ),
          BuildLanguageButton(),
        ],
      ),
    );
  }
}
