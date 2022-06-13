import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  const factory Food({
    @JsonKey(name: "foodId") int? foodId,
    @JsonKey(name: "foodName") String? foodName,
    @JsonKey(name: "alias") String? alias,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "favorite") int? favorite,
    @JsonKey(name: "ratingScore") double? ratingScore,
    @JsonKey(name: "ratingScoreCount") String? ratingScoreCount,
    @JsonKey(name: "categoryId") int? categoryId,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created") String? created,
    @JsonKey(name: "updated") String? updated,
  }) = _Food;

  factory Food.fromJson(Map<String, Object?> json) => _$FoodFromJson(json);
}
