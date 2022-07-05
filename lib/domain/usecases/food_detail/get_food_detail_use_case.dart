import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/models/food/food_model.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class GetFoodDetailUseCase {
  final FoodDetailRepository foodDetailRepository;

  GetFoodDetailUseCase({
    required this.foodDetailRepository,
  });

  Future<Result<FoodModel>> call({int? foodId}) async {
    try {
      if (foodId != null) {
        final food = await foodDetailRepository.callFoodDetail(foodId: foodId);
        final foodModel = mapFoodToFoodModel(food);
        return Result.success(data: foodModel);
      } else {
        String message = "Food id is null.";
        throw Exception(message);
      }
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    } catch (error) {
      BaseError baseError = BaseError(
        message: error.toString(),
      );
      return Result.error(baseError);
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
