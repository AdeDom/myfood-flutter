import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  @JsonKey(name: "userId")
  String? userId;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "mobileNo")
  String? mobileNo;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "created")
  String? created;

  @JsonKey(name: "updated")
  String? updated;

  UserProfile({
    this.userId,
    this.email,
    this.name,
    this.mobileNo,
    this.address,
    this.image,
    this.status,
    this.created,
    this.updated,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return _$UserProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
