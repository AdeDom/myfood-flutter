import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/category/temp_category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/food_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/temp_food_local_data_source.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/home/home_food_repository.dart';

class HomeFoodRepositoryImpl with HomeFoodRepository {
  final DataStore dataStore;
  final CategoryLocalDataSource categoryLocalDataSource;
  final FoodLocalDataSource foodLocalDataSource;
  final TempCategoryLocalDataSource tempCategoryLocalDataSource;
  final TempFoodLocalDataSource tempFoodLocalDataSource;
  final FoodRemoteDataSource foodRemoteDataSource;

  HomeFoodRepositoryImpl({
    required this.dataStore,
    required this.categoryLocalDataSource,
    required this.foodLocalDataSource,
    required this.tempCategoryLocalDataSource,
    required this.tempFoodLocalDataSource,
    required this.foodRemoteDataSource,
  });

  @override
  List<CategoryEntity> getCategoryAll() {
    return categoryLocalDataSource.getCategoryAll();
  }

  @override
  Future<BaseResponse<List<Food>?>> callFoodListByCategoryId({
    required int categoryId,
  }) async {
    return await foodRemoteDataSource.callFoodListByCategoryId(
      categoryId: categoryId,
    );
  }

  @override
  Future<void> deleteFoodAll() async {
    await foodLocalDataSource.deleteFoodAll();
  }

  @override
  Future<void> saveFoodList(List<FoodEntity> foodList) async {
    await foodLocalDataSource.saveFoodList(foodList);
  }

  @override
  int getCurrentCategoryId() {
    return dataStore.getCurrentCategoryId();
  }

  @override
  void setCurrentCategoryId({required int categoryId}) {
    dataStore.setCurrentCategoryId(categoryId: categoryId);
  }

  @override
  Future<void> clearAndSaveCategoryTemp({required int categoryId}) async {
    await tempCategoryLocalDataSource.deleteCategory();
    final categoryHomePage = categoryLocalDataSource.getCategoryByCategoryId(
      categoryId: categoryId,
    );
    await tempCategoryLocalDataSource.saveCategory(categoryHomePage);
  }

  @override
  Future<void> clearAndSaveFoodTemp({required int categoryId}) async {
    await tempFoodLocalDataSource.deleteFoodAll();
    final foodHomePageList = foodLocalDataSource.getFoodListByCategoryId(
      categoryId,
    );
    await tempFoodLocalDataSource.saveFoodList(foodHomePageList);
  }
}
