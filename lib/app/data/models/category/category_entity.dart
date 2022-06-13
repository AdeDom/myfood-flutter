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

  @HiveField(3)
  String? categoryTypeName;

  @HiveField(4)
  String? created;

  @HiveField(5)
  String? updated;

  CategoryEntity({
    this.categoryId,
    this.categoryName,
    this.image,
    this.categoryTypeName,
    this.created,
    this.updated,
  });

  CategoryEntity.fromJson(Map<String, dynamic> json) {
    categoryId = json["categoryId"];
    categoryName = json["categoryName"];
    image = json["image"];
    categoryTypeName = json["categoryTypeName"];
    created = json["created"];
    updated = json["updated"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["categoryId"] = categoryId;
    data["categoryName"] = categoryName;
    data["image"] = image;
    data["categoryTypeName"] = categoryTypeName;
    data["created"] = created;
    data["updated"] = updated;
    return data;
  }
}
