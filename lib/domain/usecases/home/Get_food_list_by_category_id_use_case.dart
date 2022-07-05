import 'package:myfood/domain/repositories/home/home_food_repository.dart';

class GetFoodListByCategoryIdUseCase {
  final HomeFoodRepository foodRepository;

  GetFoodListByCategoryIdUseCase({
    required this.foodRepository,
  });

  Future<void> call(int? categoryId) async {
    if (categoryId != null) {
      foodRepository.setCurrentCategoryId(categoryId: categoryId);
      await foodRepository.clearAndSaveCategoryTempByCategoryId(
        categoryId: categoryId,
      );
      await foodRepository.clearAndSaveFoodTempByCategoryId(
        categoryId: categoryId,
      );
    } else {
      String message = "Category id is null.";
      throw Exception(message);
    }
  }
}
