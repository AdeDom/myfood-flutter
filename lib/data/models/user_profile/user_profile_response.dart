import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';

class UserProfileResponse {
  String? version;
  String? status;
  BaseError? error;
  UserProfile? result;

  UserProfileResponse({
    this.version,
    this.status,
    this.error,
    this.result,
  });

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    status = json['status'];
    error = json['error'] != null ? BaseError.fromJson(json['error']) : null;
    result =
        json['result'] != null ? UserProfile.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['status'] = status;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}
