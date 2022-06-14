import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class FoodDetailRepositoryImpl with FoodDetailRepository {
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodDetailRepositoryImpl({
    required this.foodRemoteDataSource,
  });

  @override
  Future<Result<Food>> callFoodDetail({required int foodId}) async {
    try {
      final response = await foodRemoteDataSource.callFoodDetail(
        foodId: foodId,
      );

      return Result.success(data: response.result);
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    } catch (error) {
      BaseError baseError = BaseError(message: error.toString());
      return Result.error(baseError);
    }
  }
}
