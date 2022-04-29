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
              const SizedBox(height: 64),
              _buildRegisterTitle(),
              const SizedBox(height: 16),
              _buildRegisterSubTitle(),
              const SizedBox(height: 32),
              _buildWidgetTextFormField(labelText: "Name"),
              const SizedBox(height: 32),
              _buildWidgetTextFormField(labelText: "Email"),
              const SizedBox(height: 32),
              _buildWidgetTextFormField(labelText: "Mobile No"),
              const SizedBox(height: 32),
              _buildWidgetTextFormField(labelText: "Address"),
              const SizedBox(height: 32),
              _buildWidgetTextFormField(labelText: "Password"),
              const SizedBox(height: 32),
              _buildWidgetTextFormField(labelText: "Confirm Password"),
              const SizedBox(height: 32),
              _buildRegisterButton(),
              const SizedBox(height: 32),
              _buildAlreadyHaveAccount(),
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

  Widget _buildWidgetTextFormField({String? labelText}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          )),
      width: 360,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFFFD700),
      ),
      child: const Center(
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildAlreadyHaveAccount() {
    return GestureDetector(
      onTap: () {
        print("Already have account");
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Already have an Account?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFD700),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
