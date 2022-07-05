import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';

mixin FoodLocalDataSource {
  List<FoodEntity> getFoodList();

  List<FoodEntity> getFoodListByCategoryId({required int categoryId});

  Future<void> saveFoodList(List<FoodEntity> foodList);

  Future<void> deleteFoodAll();
}

class FoodLocalDataSourceImpl with FoodLocalDataSource {
  final box = Hive.box(DatabaseConstant.tableFood);

  @override
  List<FoodEntity> getFoodList() {
    return box.values.map((element) {
      return FoodEntity(
        foodId: element.foodId,
        foodName: element.foodName,
        alias: element.alias,
        image: element.image,
        ratingScoreCount: element.ratingScoreCount,
        categoryId: element.categoryId,
      );
    }).toList();
  }

  @override
  List<FoodEntity> getFoodListByCategoryId({required int categoryId}) {
    return box.values
        .where((element) => element.categoryId == categoryId)
        .map((element) {
      return FoodEntity(
        foodId: element.foodId,
        foodName: element.foodName,
        alias: element.alias,
        image: element.image,
        ratingScoreCount: element.ratingScoreCount,
        categoryId: element.categoryId,
      );
    }).toList();
  }

  @override
  Future<void> saveFoodList(List<FoodEntity> foodList) async {
    await box.addAll(foodList);
  }

  @override
  Future<void> deleteFoodAll() async {
    for (var element in box.keys) {
      await box.delete(element);
    }
  }
}
