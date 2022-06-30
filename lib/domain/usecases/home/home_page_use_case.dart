import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/home/home_category_repository.dart';
import 'package:myfood/domain/repositories/home/home_food_repository.dart';

class HomePageUseCase {
  final HomeCategoryRepository categoryRepository;
  final HomeFoodRepository foodRepository;

  HomePageUseCase({
    required this.categoryRepository,
    required this.foodRepository,
  });

  Future<Result> call() async {
    try {
      return await callCategoryAll();
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    } catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.toString());
      BaseError baseError = BaseError.fromJson(jsonError);
      return Result.error(baseError);
    }
  }

  Future<Result> callCategoryAll() async {
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

    return await callFoodListByCategoryId();
  }

  Future<Result> callFoodListByCategoryId() async {
    final categoryAll = foodRepository.getCategoryAll();
    List<Future<BaseResponse<List<Food>?>>> futureList = [];
    categoryAll.forEach((element) async {
      int? categoryId = element.categoryId;
      if (categoryId != null) {
        final foodResponse = foodRepository.callFoodListByCategoryId(
          categoryId: categoryId,
        );
        futureList.add(foodResponse);
      }
    });

    final foodListAdd = await Future.wait<BaseResponse<List<Food>?>>(futureList);
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
        await foodRepository.saveFoodList(foodEntity);
      }
    });

    await foodRepository.saveTampCategory();

    await foodRepository.saveTampFood();

    return const Result.success();
  }
}
