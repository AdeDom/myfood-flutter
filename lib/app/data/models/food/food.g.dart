// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Food _$$_FoodFromJson(Map<String, dynamic> json) => _$_Food(
      foodId: json['foodId'] as int?,
      foodName: json['foodName'] as String?,
      alias: json['alias'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      favorite: json['favorite'] as int?,
      ratingScore: (json['ratingScore'] as num?)?.toDouble(),
      ratingScoreCount: json['ratingScoreCount'] as String?,
      categoryId: json['categoryId'] as int?,
      status: json['status'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$$_FoodToJson(_$_Food instance) => <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'alias': instance.alias,
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
      'favorite': instance.favorite,
      'ratingScore': instance.ratingScore,
      'ratingScoreCount': instance.ratingScoreCount,
      'categoryId': instance.categoryId,
      'status': instance.status,
      'created': instance.created,
      'updated': instance.updated,
    };
