import 'package:flutter/material.dart';

class BuildLoginTopSection extends StatelessWidget {
  const BuildLoginTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        _buildLoginTitle(),
        const SizedBox(
          height: 16,
        ),
        _buildLoginSubTitle(),
      ],
    );
  }

  Widget _buildLoginTitle() {
    return const Text(
      "Login",
      style: TextStyle(
        color: Colors.black,
        fontSize: 32,
      ),
    );
  }

  Widget _buildLoginSubTitle() {
    return const Text(
      "Add your details to login",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}
