import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: "userId") String? userId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "mobileNo") String? mobileNo,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created") String? created,
    @JsonKey(name: "updated") String? updated,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
