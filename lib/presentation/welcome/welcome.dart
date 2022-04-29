import 'package:flutter/material.dart';
import 'package:myfood/presentation/welcome/widget/BuildWelcomeBottomSection.dart';
import 'package:myfood/presentation/welcome/widget/BuildWelcomeCenterSection.dart';
import 'package:myfood/presentation/welcome/widget/BuildWelcomeTopSection.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          BuildWelcomeTopSection(),
          BuildWelcomeCenterSection(),
          BuildWelcomeBottomSection(),
        ],
      ),
    );
  }
}
