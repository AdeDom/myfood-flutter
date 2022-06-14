import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';

mixin CategoryLocalDataSource {
  List<CategoryEntity> getCategoryAll();

  Future<void> saveCategoryAll(List<CategoryEntity> categoryAll);

  Future<void> deleteCategoryAll();
}

class CategoryLocalDataSourceImpl with CategoryLocalDataSource {
  final box = Hive.box(DatabaseConstant.tableCategory);

  @override
  List<CategoryEntity> getCategoryAll() {
    return box.values.map((element) {
      return CategoryEntity(
        categoryId: element.categoryId,
        categoryName: element.categoryName,
        image: element.image,
        categoryTypeName: element.categoryTypeName,
        created: element.created,
        updated: element.updated,
      );
    }).toList();
  }

  @override
  Future<void> saveCategoryAll(List<CategoryEntity> categoryAll) async {
    await box.addAll(categoryAll);
  }

  @override
  Future<void> deleteCategoryAll() async {
    for (var element in box.keys) {
      await box.delete(element);
    }
  }
}
