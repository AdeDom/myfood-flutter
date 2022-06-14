import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/food_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/temp_food_local_data_source.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/food/food_repository.dart';

class FoodRepositoryImpl with FoodRepository {
  final DataStore dataStore;
  final CategoryLocalDataSource categoryLocalDataSource;
  final FoodLocalDataSource foodLocalDataSource;
  final TempFoodLocalDataSource tempFoodLocalDataSource;
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({
    required this.dataStore,
    required this.categoryLocalDataSource,
    required this.foodLocalDataSource,
    required this.tempFoodLocalDataSource,
    required this.foodRemoteDataSource,
  });

  @override
  Future<void> callFoodListByCategoryId() async {
    final categoryAll = categoryLocalDataSource.getCategoryAll();
    List<Future<BaseResponse<List<Food>>>> futureList = [];
    categoryAll.forEach((element) async {
      int? categoryId = element.categoryId;
      if (categoryId != null) {
        final foodResponse = foodRemoteDataSource.callFoodListByCategoryId(
          categoryId: categoryId,
        );
        futureList.add(foodResponse);
      }
    });

    final foodListAdd = await Future.wait<BaseResponse<List<Food>>>(futureList);
    await foodLocalDataSource.deleteFoodAll();
    foodListAdd.forEach((element) async {
      final foodList = element.result;
      if (foodList != null) {
        List<FoodEntity> foodEntity = foodList.map((food) {
          return FoodEntity(
            foodId: food.foodId,
            foodName: food.foodName,
            alias: food.alias,
            image: food.image,
            price: food.price,
            description: food.description,
            favorite: food.favorite,
            ratingScore: food.ratingScore,
            ratingScoreCount: food.ratingScoreCount,
            categoryId: food.categoryId,
            status: food.status,
            created: food.created,
            updated: food.updated,
          );
        }).toList();
        await foodLocalDataSource.saveFoodList(foodEntity);
      }
    });

    await tempFoodLocalDataSource.deleteFoodAll();
    int categoryId = dataStore.getCurrentCategoryId();
    final foodHomePageList = foodLocalDataSource.getFoodListByCategoryId(
      categoryId,
    );
    tempFoodLocalDataSource.saveFoodList(foodHomePageList);
  }
}
