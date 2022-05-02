import 'package:flutter/material.dart';
import 'package:myfood/presentation/welcome/widget/build_welcome_bottom_section.dart';
import 'package:myfood/presentation/welcome/widget/build_welcome_center_section.dart';
import 'package:myfood/presentation/welcome/widget/build_welcome_top_section.dart';

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
