import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class GetFoodDetailUseCase {
  final FoodDetailRepository foodDetailRepository;

  GetFoodDetailUseCase({
    required this.foodDetailRepository,
  });

  Future<Result<Food>> call({int? foodId}) async {
    if (foodId != null) {
      try {
        final food = await foodDetailRepository.callFoodDetail(foodId: foodId);
        return Result.success(data: food);
      } on ApiServiceManagerException catch (error) {
        Map<String, dynamic> jsonError = json.decode(error.message);
        BaseError baseError = BaseError.fromJson(jsonError);
        return Result.error(baseError);
      } catch (error) {
        Map<String, dynamic> jsonError = json.decode(error.toString());
        BaseError baseError = BaseError.fromJson(jsonError);
        return Result.error(baseError);
      }
    } else {
      String message = "Food id is null.";
      BaseError error = BaseError(message: message);
      Result<Food> resultError = Result.error(error);
      return Future.value(resultError);
    }
  }
}
