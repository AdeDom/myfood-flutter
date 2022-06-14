import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/repositories/result.dart';

mixin FoodDetailRepository {
  Future<Result<Food>> callFoodDetail({
    required int foodId,
  });
}
