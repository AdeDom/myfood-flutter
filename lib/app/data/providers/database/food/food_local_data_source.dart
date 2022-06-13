import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';

mixin FoodLocalDataSource {
  Future<List<FoodEntity>?> getFoodList();

  Future<void> saveFoodList(List<FoodEntity> foodList);

  Future<void> deleteFoodAll();
}

class FoodLocalDataSourceImpl with FoodLocalDataSource {
  final box = Hive.box(DatabaseConstant.tableFood);

  @override
  Future<List<FoodEntity>?> getFoodList() async {
    return await box.get(DatabaseConstant.tableFood);
  }

  @override
  Future<void> saveFoodList(List<FoodEntity> foodList) async {
    await box.addAll(foodList);
  }

  @override
  Future<void> deleteFoodAll() async {
    await box.delete(DatabaseConstant.tableFood);
  }
}
