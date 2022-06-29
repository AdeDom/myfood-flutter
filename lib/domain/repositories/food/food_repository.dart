import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';

mixin FoodRepository {
  List<CategoryEntity> getCategoryAll();

  Future<BaseResponse<List<Food>?>> callFoodListByCategoryId({
    required int categoryId,
  });

  Future<void> deleteFoodAll();

  Future<void> saveFoodList(List<FoodEntity> foodList);

  Future<void> saveTampCategory();

  Future<void> saveTampFood();

  Future<void> getFoodListByCategoryId({required int categoryId});
}
