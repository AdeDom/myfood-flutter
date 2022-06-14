import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';

mixin FoodRemoteDataSource {
  Future<BaseResponse<List<Food>>> callFoodListByCategoryId({
    required int categoryId,
  });

  Future<BaseResponse<Food>> callFoodDetail({
    required int foodId,
  });
}

class FoodRemoteDatSourceImpl with FoodRemoteDataSource {
  final MyFoodDio myFoodDio;

  FoodRemoteDatSourceImpl({
    required this.myFoodDio,
  });

  @override
  Future<BaseResponse<List<Food>>> callFoodListByCategoryId({
    required int categoryId,
  }) async {
    final response = await myFoodDio.get(
      "api/food/getFoodByCategoryId?categoryId=$categoryId",
    );

    return BaseResponse<List<Food>>.fromJson(response.data, (json) {
      final jsonList = json as List<dynamic>? ?? [];
      final foodList = jsonList.map((json) => Food.fromJson(json));
      return foodList.toList();
    });
  }

  @override
  Future<BaseResponse<Food>> callFoodDetail({required int foodId}) async {
    final response = await myFoodDio.get("api/food/detail?foodId=$foodId");

    return BaseResponse<Food>.fromJson(
      response.data,
      (json) => Food.fromJson(json),
    );
  }
}
