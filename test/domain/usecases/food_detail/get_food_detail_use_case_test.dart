import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/food/food.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/models/food/food_model.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';
import 'package:myfood/domain/usecases/food_detail/get_food_detail_use_case.dart';

import '../../../mock.dart';

main() {
  late FoodDetailRepository foodDetailRepository;
  late GetFoodDetailUseCase useCase;

  setUp(() {
    foodDetailRepository = MockFoodDetailRepository();
    useCase = GetFoodDetailUseCase(
      foodDetailRepository: foodDetailRepository,
    );
  });

  test("GetFoodDetailUseCase_returnSuccess", () async {
    int foodId = 21;
    String jsonString = """
    {
    "version": "1.0",
    "status": "success",
    "result": {
        "foodId": 21,
        "foodName": "Tom Kha Gai",
        "alias": "Chicken in Coconut Soup",
        "image": "https://img.theculturetrip.com/1440x/smart/wp-content/uploads/2020/04/2ay2rhg.jpg",
        "price": 99.0,
        "description": "Tom kha gai is related to tom yum and offers people with a lower tolerance to spice the opportunity to taste the same beautiful flavours. Besides the spice scale, Tom kha gai is also unique in that it typically comes with lots of creamy coconut milk creating a rich sweet soup. Like most Thai foods, vegetarian options are easily adaptable by substituting a few ingredients.",
        "categoryId": 41,
        "status": "active",
        "created": "26/3/2022 20:54"
    }
}
    """;
    final data = json.decode(jsonString);
    final foodDetailResponse = BaseResponse.fromJson(data, (json) {
      return Food.fromJson(json);
    });
    when(
      () => foodDetailRepository.callFoodDetail(foodId: foodId),
    ).thenAnswer((_) async => foodDetailResponse.result);

    final result = await useCase(foodId: foodId);

    FoodModel foodModel = const FoodModel(
      foodName: "Tom Kha Gai",
      image:
          "https://img.theculturetrip.com/1440x/smart/wp-content/uploads/2020/04/2ay2rhg.jpg",
      price: 99.0,
      description:
          "Tom kha gai is related to tom yum and offers people with a lower tolerance to spice the opportunity to taste the same beautiful flavours. Besides the spice scale, Tom kha gai is also unique in that it typically comes with lots of creamy coconut milk creating a rich sweet soup. Like most Thai foods, vegetarian options are easily adaptable by substituting a few ingredients.",
      ratingScoreCount: "-",
    );
    Result<FoodModel> resultSuccess = Result.success(
      data: foodModel,
    );
    expect(result, resultSuccess);
  });

  test("GetFoodDetailUseCase_foodIdIsNullOrBlank_returnError", () async {
    final result = await useCase();

    String message = "Food id is null.";
    BaseError error = BaseError(message: message);
    Result<FoodModel> resultError = Result.error(error);
    expect(result, resultError);
  });
}
