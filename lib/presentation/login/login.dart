import 'package:flutter/material.dart';
import 'package:myfood/presentation/login/widget/build_login_bottom_section.dart';
import 'package:myfood/presentation/login/widget/build_login_center_section.dart';
import 'package:myfood/presentation/login/widget/build_login_top_section.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          BuildLoginTopSection(),
          BuildLoginCenterSection(),
          BuildLoginBottomSection(),
        ],
      ),
    );
  }
}
