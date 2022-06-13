import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/models/home/home_model.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';

class HomeRepositoryImpl with HomeRepository {
  final CategoryRepository categoryRepository;

  HomeRepositoryImpl({
    required this.categoryRepository,
  });

  @override
  Future<Result<HomeModel>> callHomePage() async {
    List<Category> categoryList = await categoryRepository.callCategoryAll();
    HomeModel homeModel = HomeModel(
      categoryList: categoryList,
    );
    return Result.success(data: homeModel);
  }
}
