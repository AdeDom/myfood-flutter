import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/network/category/category_remote_data_source.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl with CategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({
    required this.categoryLocalDataSource,
    required this.categoryRemoteDataSource,
  });

  @override
  Future<void> callCategoryAll() async {
    final categoryResponse = await categoryRemoteDataSource.callCategoryAll();
    final categoryAll = categoryResponse.result;
    if (categoryAll != null) {
      await categoryLocalDataSource.deleteCategoryAll();
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
      await categoryLocalDataSource.saveCategoryAll(categoryEntity);
    }
  }
}
