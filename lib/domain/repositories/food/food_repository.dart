mixin FoodRepository {
  Future<void> callFoodListByCategoryId();

  Future<void> getFoodListByCategoryId({required int categoryId});
}
