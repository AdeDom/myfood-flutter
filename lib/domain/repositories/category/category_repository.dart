import 'package:myfood/app/data/models/category/category.dart';

mixin CategoryRepository {
  Future<List<Category>> callCategoryAll();
}
