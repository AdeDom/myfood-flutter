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
  double? price;

  @HiveField(5)
  String? description;

  @HiveField(6)
  int? favorite;

  @HiveField(7)
  double? ratingScore;

  @HiveField(8)
  String? ratingScoreCount;

  @HiveField(9)
  int? categoryId;

  @HiveField(10)
  String? status;

  @HiveField(11)
  String? created;

  @HiveField(12)
  String? updated;

  FoodEntity({
    this.foodId,
    this.foodName,
    this.alias,
    this.image,
    this.price,
    this.description,
    this.favorite,
    this.ratingScore,
    this.ratingScoreCount,
    this.categoryId,
    this.status,
    this.created,
    this.updated,
  });

  FoodEntity.fromJson(Map<String, dynamic> json) {
    foodId = json["foodId"];
    foodName = json["foodName"];
    alias = json["alias"];
    image = json["image"];
    price = json["price"];
    description = json["description"];
    favorite = json["favorite"];
    ratingScore = json["ratingScore"];
    ratingScoreCount = json["ratingScoreCount"];
    categoryId = json["categoryId"];
    status = json["status"];
    created = json["created"];
    updated = json["updated"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["foodId"] = foodId;
    data["foodName"] = foodName;
    data["alias"] = alias;
    data["image"] = image;
    data["price"] = price;
    data["description"] = description;
    data["favorite"] = favorite;
    data["ratingScore"] = ratingScore;
    data["ratingScoreCount"] = ratingScoreCount;
    data["categoryId"] = categoryId;
    data["status"] = status;
    data["created"] = created;
    data["updated"] = updated;
    return data;
  }
}
