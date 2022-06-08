import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/food_detail_controller.dart';

class FoodDetailView extends GetView<FoodDetailController> {
  const FoodDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Food detail (foodId = Hello)"),
    );
  }
}
