import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/models/food/food.dart';

part 'food_detail_state.freezed.dart';

@freezed
class FoodDetailState with _$FoodDetailState {
  const factory FoodDetailState.initial() = Initial;

  const factory FoodDetailState.loadSuccess({
    required Food food,
  }) = LoadSuccess;

  const factory FoodDetailState.loadError({
    required BaseError error,
  }) = LoadError;
}
