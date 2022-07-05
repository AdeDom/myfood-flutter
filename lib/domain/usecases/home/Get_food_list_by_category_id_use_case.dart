import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/home/home_food_repository.dart';

class GetFoodListByCategoryIdUseCase {
  final HomeFoodRepository foodRepository;

  GetFoodListByCategoryIdUseCase({
    required this.foodRepository,
  });

  Future<Result> call(int? categoryId) async {
    if (categoryId != null) {
      foodRepository.setCurrentCategoryId(categoryId: categoryId);
      await foodRepository.clearAndSaveCategoryTemp(categoryId: categoryId);
      await foodRepository.clearAndSaveFoodTemp(categoryId: categoryId);
      return const Result.success();
    } else {
      String message = "Category id is null.";
      BaseError error = BaseError(message: message);
      Result resultError = Result.error(error);
      return Future.value(resultError);
    }
  }
}
