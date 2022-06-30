import 'package:hive_flutter/hive_flutter.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 1)
class CategoryEntity {
  @HiveField(0)
  int? categoryId;

  @HiveField(1)
  String? categoryName;

  @HiveField(2)
  String? image;

  CategoryEntity({
    this.categoryId,
    this.categoryName,
    this.image,
  });

  CategoryEntity.fromJson(Map<String, dynamic> json) {
    categoryId = json["categoryId"];
    categoryName = json["categoryName"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["categoryId"] = categoryId;
    data["categoryName"] = categoryName;
    data["image"] = image;
    return data;
  }
}
