import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';

part 'food_model.g.dart';

@freezed
class FoodModel with _$FoodModel {
  const factory FoodModel({
    required String foodName,
    required String image,
    required double price,
    required String description,
    required String ratingScoreCount,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, Object?> json) =>
      _$FoodModelFromJson(json);
}
