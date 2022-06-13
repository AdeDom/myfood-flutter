import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/food_local_data_source.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/domain/repositories/food/food_repository.dart';

class FoodRepositoryImpl with FoodRepository {
  final CategoryLocalDataSource categoryLocalDataSource;
  final FoodLocalDataSource foodLocalDataSource;
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({
    required this.categoryLocalDataSource,
    required this.foodLocalDataSource,
    required this.foodRemoteDataSource,
  });

  @override
  Future<void> callFoodListByCategoryId() async {
    await foodLocalDataSource.deleteFoodAll();
    final categoryAll = categoryLocalDataSource.getCategoryAll();
    categoryAll?.forEach((element) async {
      int? categoryId = element.categoryId;
      if (categoryId != null) {
        final foodResponse = await foodRemoteDataSource.callFoodListByCategoryId(
          categoryId: categoryId,
        );
        final foodList = foodResponse.result;
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
      }
    });
  }
}
