import 'package:hive_flutter/hive_flutter.dart';

part 'food_entity.g.dart';

@HiveType(typeId: 2)
class FoodEntity {
  @HiveField(0)
  int? foodId;

  @HiveField(1)
  String? foodName;

  @HiveField(2)
  String? alias;

  @HiveField(3)
  String? image;

  @HiveField(4)
  String? ratingScoreCount;

  @HiveField(9)
  int? categoryId;

  FoodEntity({
    this.foodId,
    this.foodName,
    this.alias,
    this.image,
    this.ratingScoreCount,
    this.categoryId,
  });

  FoodEntity.fromJson(Map<String, dynamic> json) {
    foodId = json["foodId"];
    foodName = json["foodName"];
    alias = json["alias"];
    image = json["image"];
    ratingScoreCount = json["ratingScoreCount"];
    categoryId = json["categoryId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["foodId"] = foodId;
    data["foodName"] = foodName;
    data["alias"] = alias;
    data["image"] = image;
    data["ratingScoreCount"] = ratingScoreCount;
    data["categoryId"] = categoryId;
    return data;
  }
}
