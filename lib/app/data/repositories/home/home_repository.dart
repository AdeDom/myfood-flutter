import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';
import 'package:myfood/domain/repositories/food/food_repository.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';

class HomeRepositoryImpl with HomeRepository {
  final CategoryRepository categoryRepository;
  final FoodRepository foodRepository;

  HomeRepositoryImpl({
    required this.categoryRepository,
    required this.foodRepository,
  });

  @override
  Future<Result> callHomePage() async {
    try {
      await categoryRepository.callCategoryAll();

      await foodRepository.callFoodListByCategoryId();

      return const Result.success();
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    } catch (error) {
      BaseError baseError = BaseError(message: error.toString());
      return Result.error(baseError);
    }
  }

  @override
  Future<Result> getFoodListByCategoryId({required int categoryId}) async {
    try {
      await foodRepository.getFoodListByCategoryId(categoryId: categoryId);

      return const Result.success();
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
