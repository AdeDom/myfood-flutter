class Token {
  Token({
    this.accessToken,
    this.refreshToken,
  });

  String? accessToken;
  String? refreshToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
