import 'package:flutter/material.dart';
import 'package:myfood/app/data/models/base/base_error.dart';

class ErrorDialog extends StatelessWidget {
  BaseError baseError;
  Function onPressed;

  ErrorDialog({
    Key? key,
    required this.baseError,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: Text(baseError.message ?? "-"),
      actions: [
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
