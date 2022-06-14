import 'package:myfood/app/data/repositories/result.dart';

mixin HomeRepository {
  Future<Result> callHomePage();

  Future<Result> getFoodListByCategoryId({required int categoryId});
}
