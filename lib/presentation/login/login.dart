import 'package:flutter/material.dart';
import 'package:myfood/presentation/login/widget/build_login_bottom_section.dart';
import 'package:myfood/presentation/login/widget/build_login_center_section.dart';
import 'package:myfood/presentation/login/widget/build_login_top_section.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Bottom view move on top key board
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
