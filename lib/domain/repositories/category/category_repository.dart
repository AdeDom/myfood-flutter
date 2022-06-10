import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/repositories/result.dart';

mixin CategoryRepository {
  Future<Result<List<Category>>> callCategoryAll();
}
