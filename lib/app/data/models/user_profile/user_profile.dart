import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@Freezed()
class UserProfile with _$UserProfile {
  factory UserProfile({
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
