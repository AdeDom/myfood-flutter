import 'package:flutter/material.dart';

class BuildSkipButton extends StatelessWidget {
  const BuildSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Skip button");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Don't want login?",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Skip",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(230, 255, 215, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
