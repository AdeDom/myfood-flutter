class BaseError {
  BaseError({
    this.code,
    this.message,
  });

  String? code;
  String? message;

  factory BaseError.fromJson(Map<String, dynamic> json) => BaseError(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
