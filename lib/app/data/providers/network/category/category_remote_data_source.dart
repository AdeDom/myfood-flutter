import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';

mixin CategoryRemoteDataSource {
  Future<BaseResponse<List<Category>>> callCategoryAll();
}

class CategoryRemoteDataSourceImpl with CategoryRemoteDataSource {
  final MyFoodDio myFoodDio;

  CategoryRemoteDataSourceImpl({
    required this.myFoodDio,
  });

  @override
  Future<BaseResponse<List<Category>>> callCategoryAll() async {
    final response = await myFoodDio.get("api/category/getCategoryAll");

    return BaseResponse<List<Category>>.fromJson(
      response.data,
      (json) {
        final jsonList = json as List<dynamic>? ?? [];
        final categoryAll = jsonList.map((json) => Category.fromJson(json));
        return categoryAll.toList();
      },
    );
  }
}
