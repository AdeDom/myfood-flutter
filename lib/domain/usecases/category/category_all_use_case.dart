import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';

class CategoryAllUseCase {
  final CategoryRepository categoryRepository;

  CategoryAllUseCase({
    required this.categoryRepository,
  });

  Future<Result<List<Category>>> call() {
    return categoryRepository.callCategoryAll();
  }
}
