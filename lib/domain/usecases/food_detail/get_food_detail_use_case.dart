import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/domain/models/food/food_model.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class GetFoodDetailUseCase {
  final FoodDetailRepository foodDetailRepository;

  GetFoodDetailUseCase({
    required this.foodDetailRepository,
  });

  Future<FoodModel> call({int? foodId}) async {
    if (foodId != null) {
      final food = await foodDetailRepository.callFoodDetail(foodId: foodId);
      final foodModel = mapFoodToFoodModel(food);
      return foodModel;
    } else {
      String message = "Food id is null.";
      throw Exception(message);
    }
  }

  FoodModel mapFoodToFoodModel(Food? food) {
    return FoodModel(
      foodName: food?.foodName ?? "-",
      image: food?.image ?? "-",
      price: food?.price ?? 0,
      description: food?.description ?? "-",
      ratingScoreCount: food?.ratingScoreCount ?? "-",
    );
  }
}
