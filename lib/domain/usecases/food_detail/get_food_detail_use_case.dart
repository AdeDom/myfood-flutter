import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class GetFoodDetailUseCase {
  final FoodDetailRepository foodDetailRepository;

  GetFoodDetailUseCase({
    required this.foodDetailRepository,
  });

  Future<Result<Food>> call({int? foodId}) {
    if (foodId != null) {
      return foodDetailRepository.callFoodDetail(foodId: foodId);
    } else {
      String message = "Food id is null.";
      BaseError error = BaseError(message: message);
      Result<Food> resultError = Result.error(error);
      return Future.value(resultError);
    }
  }
}
