import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';

mixin CategoryLocalDataSource {
  Future<List<CategoryEntity>?> getCategoryAll();

  Future<void> saveCategoryAll(List<CategoryEntity> categoryAll);

  Future<void> deleteCategoryAll();
}

class CategoryLocalDataSourceImpl with CategoryLocalDataSource {
  final box = Hive.box(DatabaseConstant.tableCategory);

  @override
  Future<List<CategoryEntity>?> getCategoryAll() async {
    return await box.get(DatabaseConstant.tableCategory);
  }

  @override
  Future<void> saveCategoryAll(List<CategoryEntity> categoryAll) async {
    await box.addAll(categoryAll);
  }

  @override
  Future<void> deleteCategoryAll() async {
    await box.delete(DatabaseConstant.tableCategory);
  }
}
