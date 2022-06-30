// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodModel _$$_FoodModelFromJson(Map<String, dynamic> json) => _$_FoodModel(
      foodName: json['foodName'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      ratingScoreCount: json['ratingScoreCount'] as String,
    );

Map<String, dynamic> _$$_FoodModelToJson(_$_FoodModel instance) =>
    <String, dynamic>{
      'foodName': instance.foodName,
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
      'ratingScoreCount': instance.ratingScoreCount,
    };
