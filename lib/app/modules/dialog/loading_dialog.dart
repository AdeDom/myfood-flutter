import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Loading"),
      content: SizedBox(
        width: 50,
        height: 200,
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Color(0xFFFFD700),
        ),
      ),
    );
  }
}
