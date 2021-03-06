import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/app_constant.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/modules/home/controllers/home_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleSection(),
        _buildSearchSection(),
        SizedBox(
          height: 150,
          child: _buildCategoryListSection(),
        ),
        _buildCategoryNameSection(),
        Expanded(
          child: _buildFoodListSection(),
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Row(
      children: [
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
            ),
            child: Text(
              "Food",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {
            controller.setLogout();
            Get.offAllNamed(Routes.WELCOME);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FormBuilderTextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          labelText: "Search food",
          prefixIcon: const Icon(Icons.search),
        ),
        // validator: controller.validateEmail,
        name: AppConstant.searchKey,
        // onChanged: controller.setEmail,
        // initialValue: email,
      ),
    );
  }

  Widget _buildCategoryListSection() {
    return ValueListenableBuilder(
      valueListenable: Hive.box(DatabaseConstant.tableCategory).listenable(),
      builder: (context, Box box, widget) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: box.length,
            itemBuilder: (context, index) {
              final category = box.getAt(index) as CategoryEntity;
              return GestureDetector(
                onTap: () {
                  controller.getFoodListByCategoryId(category.categoryId);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Image.network(
                            category.image ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category.categoryName ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCategoryNameSection() {
    return ValueListenableBuilder(
      valueListenable: Hive.box(DatabaseConstant.tempCategory).listenable(),
      builder: (context, Box box, widget) {
        CategoryEntity? category = box.get(DatabaseConstant.tempCategory);
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            category?.categoryName ?? "-",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFoodListSection() {
    return ValueListenableBuilder(
      valueListenable: Hive.box(DatabaseConstant.tempFood).listenable(),
      builder: (context, Box box, widget) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 8,
            top: 8,
            right: 8,
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: box.length,
            itemBuilder: (context, index) {
              final food = box.getAt(index) as FoodEntity;
              return GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.FOOD_DETAIL,
                    arguments: food.foodId,
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Image.network(
                            food.image ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.foodName ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            food.alias ?? "-",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                food.ratingScoreCount ?? "-",
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
