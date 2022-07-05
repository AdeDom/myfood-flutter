import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';

mixin HomeFoodRepository {
  List<CategoryEntity> getCategoryAll();

  Future<BaseResponse<List<Food>?>> callFoodListByCategoryId({
    required int categoryId,
  });

  Future<void> deleteFoodAll();

  Future<void> saveFoodList(List<FoodEntity> foodList);

  int getCurrentCategoryId();

  void setCurrentCategoryId({required int categoryId});

  Future<void> clearAndSaveCategoryTemp({required int categoryId});

  Future<void> clearAndSaveFoodTemp({required int categoryId});
}
