import 'package:myfood/app/data/models/food/food.dart';

mixin FoodDetailRepository {
  Future<Food?> callFoodDetail({
    required int foodId,
  });
}
