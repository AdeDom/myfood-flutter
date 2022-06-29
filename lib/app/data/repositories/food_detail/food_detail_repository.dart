import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class FoodDetailRepositoryImpl with FoodDetailRepository {
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodDetailRepositoryImpl({
    required this.foodRemoteDataSource,
  });

  @override
  Future<Food?> callFoodDetail({required int foodId}) async {
    final response = await foodRemoteDataSource.callFoodDetail(
      foodId: foodId,
    );
    return response.result;
  }
}
