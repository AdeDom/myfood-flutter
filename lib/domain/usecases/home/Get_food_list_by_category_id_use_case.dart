import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';

class GetFoodListByCategoryIdUseCase {
  final HomeRepository homeRepository;

  GetFoodListByCategoryIdUseCase({
    required this.homeRepository,
  });

  Future<Result> call(int? categoryId) {
    if (categoryId != null) {
      return homeRepository.getFoodListByCategoryId(categoryId: categoryId);
    } else {
      String message = "Category is null.";
      BaseError error = BaseError(message: message);
      Result resultError = Result.error(error);
      return Future.value(resultError);
    }
  }
}
