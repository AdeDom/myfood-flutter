import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/data/providers/database/food/food_local_data_source.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/domain/repositories/food/food_repository.dart';

class FoodRepositoryImpl with FoodRepository {
  final FoodLocalDataSource foodLocalDataSource;
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({
    required this.foodLocalDataSource,
    required this.foodRemoteDataSource,
  });

  @override
  Future<void> callFoodListByCategoryId({required int categoryId}) async {
    final foodResponse = await foodRemoteDataSource.callFoodListByCategoryId(
      categoryId: categoryId,
    );
    final foodList = foodResponse.result;
    if (foodList != null) {
      await foodLocalDataSource.deleteFoodAll();
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
  }
}
