import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: "accessToken")
  String? accessToken;

  @JsonKey(name: "refreshToken")
  String? refreshToken;

  Token({
    this.accessToken,
    this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return _$TokenFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
