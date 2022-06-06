// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      mobileNo: json['mobileNo'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'mobileNo': instance.mobileNo,
      'address': instance.address,
      'image': instance.image,
      'status': instance.status,
      'created': instance.created,
      'updated': instance.updated,
    };
