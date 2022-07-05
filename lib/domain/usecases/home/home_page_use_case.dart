import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/domain/repositories/home/home_category_repository.dart';
import 'package:myfood/domain/repositories/home/home_food_repository.dart';

class HomePageUseCase {
  final HomeCategoryRepository categoryRepository;
  final HomeFoodRepository foodRepository;

  HomePageUseCase({
    required this.categoryRepository,
    required this.foodRepository,
  });

  Future<void> call() async {
    // Category list
    final categoryAll = await categoryRepository.callCategoryAll();
    if (categoryAll != null) {
      List<CategoryEntity> categoryEntity = categoryAll.map((category) {
        return CategoryEntity(
          categoryId: category.categoryId,
          categoryName: category.categoryName,
          image: category.image,
        );
      }).toList();
      await categoryRepository.saveCategoryAll(categoryEntity);
    }

    // Food list
    List<Future<BaseResponse<List<Food>?>>> futureList = [];
    categoryAll?.forEach((element) async {
      int? categoryId = element.categoryId;
      if (categoryId != null) {
        final foodResponse = foodRepository.callFoodListByCategoryId(
          categoryId: categoryId,
        );
        futureList.add(foodResponse);
      }
    });

    final foodListAdd =
        await Future.wait<BaseResponse<List<Food>?>>(futureList);
    await foodRepository.deleteFoodAll();
    foodListAdd.forEach((element) async {
      final foodList = element.result;
      if (foodList != null) {
        List<FoodEntity> foodEntity = foodList.map((food) {
          return FoodEntity(
            foodId: food.foodId,
            foodName: food.foodName,
            alias: food.alias,
            image: food.image,
            ratingScoreCount: food.ratingScoreCount,
            categoryId: food.categoryId,
          );
        }).toList();
        await foodRepository.saveFoodList(foodEntity);
      }
    });

    int categoryId = foodRepository.getCurrentCategoryId();
    await foodRepository.clearAndSaveCategoryTempByCategoryId(
      categoryId: categoryId,
    );
    await foodRepository.clearAndSaveFoodTempByCategoryId(
      categoryId: categoryId,
    );
  }
}
