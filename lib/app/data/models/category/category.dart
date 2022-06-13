import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "categoryId") int? categoryId,
    @JsonKey(name: "categoryName") String? categoryName,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "categoryTypeName") String? categoryTypeName,
    @JsonKey(name: "created") String? created,
    @JsonKey(name: "updated") String? updated,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
