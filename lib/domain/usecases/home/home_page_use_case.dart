import 'dart:convert';

import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';

class HomePageUseCase {
  final CategoryRepository categoryRepository;

  HomePageUseCase({
    required this.categoryRepository,
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
          categoryTypeName: category.categoryTypeName,
          created: category.created,
          updated: category.updated,
        );
      }).toList();
      categoryRepository.saveCategoryAll(categoryEntity);
    }

    return const Result.success();
  }
}
