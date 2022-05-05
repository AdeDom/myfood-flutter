class BaseError {
  String? message;
  String? code;

  BaseError({
    this.message,
    this.code,
  });

  BaseError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}
