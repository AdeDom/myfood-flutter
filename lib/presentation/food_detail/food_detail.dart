import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final int foodId;

  const FoodDetail({Key? key, required this.foodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Food detail (foodId = $foodId)"),
    );
  }
}
