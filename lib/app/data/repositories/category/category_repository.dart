import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/providers/network/category/category_remote_data_source.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl with CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({
    required this.categoryRemoteDataSource,
  });

  @override
  Future<List<Category>> callCategoryAll() async {
    final categoryAll = await categoryRemoteDataSource.callCategoryAll();
    return Future.value(categoryAll.result);
  }
}
