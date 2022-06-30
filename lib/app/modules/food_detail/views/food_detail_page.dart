import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/food_detail/controllers/food_detail_controller.dart';
import 'package:myfood/domain/models/food/food_model.dart';

class FoodDetailPage extends GetView<FoodDetailController> {
  final FoodModel? foodModel;

  const FoodDetailPage({
    Key? key,
    this.foodModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildFoodDetailWidget();
  }

  Widget _buildFoodDetailWidget() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: Get.height / 2,
          flexibleSpace: FlexibleSpaceBar(
            background: _buildTopSection(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: Get.height,
                color: Colors.white,
                child: _buildBottomSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopSection() {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.network(
            foodModel?.image ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(64),
                  topRight: Radius.circular(64),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(64),
                  topRight: Radius.circular(64),
                ),
                child: Container(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset(
                  "assets/images/favorite_active.png",
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodModel?.foodName ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              ),
              const SizedBox(width: 4),
              Text(
                foodModel?.ratingScoreCount ?? "-",
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                foodModel?.price.toString() ?? "-",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Bath",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            foodModel?.description ?? "",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
