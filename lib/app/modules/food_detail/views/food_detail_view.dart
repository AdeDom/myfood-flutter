import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/food_detail/views/food_detail_page.dart';

import '../controllers/food_detail_controller.dart';

class FoodDetailView extends GetView<FoodDetailController> {
  const FoodDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.state.value.when(
          initial: () {
            return const FoodDetailPage();
          },
          loadSuccess: (foodModel) {
            return FoodDetailPage(foodModel: foodModel);
          },
          loadError: (error) {
            return Container();
          },
        );
      }),
    );
  }
}
