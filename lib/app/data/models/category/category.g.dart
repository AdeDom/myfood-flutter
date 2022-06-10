// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      image: json['image'] as String?,
      categoryTypeName: json['categoryTypeName'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'image': instance.image,
      'categoryTypeName': instance.categoryTypeName,
      'created': instance.created,
      'updated': instance.updated,
    };
