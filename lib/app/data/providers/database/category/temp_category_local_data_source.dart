import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';

mixin TempCategoryLocalDataSource {
  Future<CategoryEntity?> getCategory();

  Future<void> saveCategory(CategoryEntity? category);

  Future<void> deleteCategory();
}

class TempCategoryLocalDataSourceImpl with TempCategoryLocalDataSource {
  final box = Hive.box(DatabaseConstant.tempCategory);

  @override
  Future<CategoryEntity?> getCategory() async {
    return await box.get(DatabaseConstant.tempCategory);
  }

  @override
  Future<void> saveCategory(CategoryEntity? category) async {
    await box.put(DatabaseConstant.tempCategory, category);
  }

  @override
  Future<void> deleteCategory() async {
    await box.delete(DatabaseConstant.tempCategory);
  }
}
