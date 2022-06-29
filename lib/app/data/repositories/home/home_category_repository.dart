import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/network/category/category_remote_data_source.dart';
import 'package:myfood/domain/repositories/home/home_category_repository.dart';

class HomeCategoryRepositoryImpl with HomeCategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;
  final CategoryRemoteDataSource categoryRemoteDataSource;

  HomeCategoryRepositoryImpl({
    required this.categoryLocalDataSource,
    required this.categoryRemoteDataSource,
  });

  @override
  Future<List<Category>?> callCategoryAll() async {
    final categoryResponse = await categoryRemoteDataSource.callCategoryAll();
    return categoryResponse.result;
  }

  @override
  Future<void> saveCategoryAll(List<CategoryEntity> categoryEntity) async {
    await categoryLocalDataSource.deleteCategoryAll();
    await categoryLocalDataSource.saveCategoryAll(categoryEntity);
  }
}
