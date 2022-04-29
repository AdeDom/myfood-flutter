import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              _buildRegisterTitle(),
              const SizedBox(
                height: 16,
              ),
              _buildRegisterSubTitle(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterTitle() {
    return const Text(
      "Sign Up",
      style: TextStyle(
        color: Colors.black,
        fontSize: 32,
      ),
    );
  }

  Widget _buildRegisterSubTitle() {
    return const Text(
      "Add your details to sign up",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}
