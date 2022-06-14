import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';

mixin TempFoodLocalDataSource {
  List<FoodEntity> getFoodList();

  Future<void> saveFoodList(List<FoodEntity> foodList);

  Future<void> deleteFoodAll();
}

class TempFoodLocalDataSourceImpl with TempFoodLocalDataSource {
  final box = Hive.box(DatabaseConstant.tempFood);

  @override
  List<FoodEntity> getFoodList() {
    return box.values.map((element) {
      return FoodEntity(
        foodId: element.foodId,
        foodName: element.foodName,
        alias: element.alias,
        image: element.image,
        price: element.price,
        description: element.description,
        favorite: element.favorite,
        ratingScore: element.ratingScore,
        ratingScoreCount: element.ratingScoreCount,
        categoryId: element.categoryId,
        status: element.status,
        created: element.created,
        updated: element.updated,
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
