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
import 'package:myfood/domain/repositories/food/food_repository.dart';

class FoodRepositoryImpl with FoodRepository {
  final DataStore dataStore;
  final CategoryLocalDataSource categoryLocalDataSource;
  final FoodLocalDataSource foodLocalDataSource;
  final TempCategoryLocalDataSource tempCategoryLocalDataSource;
  final TempFoodLocalDataSource tempFoodLocalDataSource;
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({
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
  Future<void> saveTampCategory() async {
    int categoryId = dataStore.getCurrentCategoryId();
    await tempCategoryLocalDataSource.deleteCategory();
    final categoryHomePage = categoryLocalDataSource.getCategoryByCategoryId(
      categoryId: categoryId,
    );
    await tempCategoryLocalDataSource.saveCategory(categoryHomePage);
  }

  @override
  Future<void> saveTampFood() async {
    int categoryId = dataStore.getCurrentCategoryId();
    await tempFoodLocalDataSource.deleteFoodAll();
    final foodHomePageList = foodLocalDataSource.getFoodListByCategoryId(
      categoryId,
    );
    tempFoodLocalDataSource.saveFoodList(foodHomePageList);
  }

  @override
  Future<void> getFoodListByCategoryId({required int categoryId}) async {
    dataStore.setCurrentCategoryId(categoryId: categoryId);

    await tempCategoryLocalDataSource.deleteCategory();
    final categoryHomePage = categoryLocalDataSource.getCategoryByCategoryId(
      categoryId: categoryId,
    );
    await tempCategoryLocalDataSource.saveCategory(categoryHomePage);

    await tempFoodLocalDataSource.deleteFoodAll();
    final foodHomePageList = foodLocalDataSource.getFoodListByCategoryId(
      categoryId,
    );
    tempFoodLocalDataSource.saveFoodList(foodHomePageList);
  }
}
