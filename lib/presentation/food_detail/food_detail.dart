import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final int _foodId;

  const FoodDetail(this._foodId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Food detail (foodId = $_foodId)"),
    );
  }
}
