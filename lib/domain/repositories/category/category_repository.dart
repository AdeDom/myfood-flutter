import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';

mixin CategoryRepository {
  Future<List<Category>?> callCategoryAll();

  Future<void> saveCategoryAll(List<CategoryEntity> categoryEntity);
}
