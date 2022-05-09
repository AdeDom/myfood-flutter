import 'package:myfood/app/config/database_constant.dart';

class UserEntity {
  String? userId;
  String? username;
  String? name;
  String? email;
  String? mobileNo;
  String? address;
  String? image;
  String? status;
  String? created;
  String? updated;

  UserEntity({
    this.userId,
    this.username,
    this.name,
    this.email,
    this.mobileNo,
    this.address,
    this.image,
    this.status,
    this.created,
    this.updated,
  });

  UserEntity.fromJson(Map<String, dynamic> json) {
    userId = json[DatabaseConstant.columnUserId];
    username = json[DatabaseConstant.columnUsername];
    name = json[DatabaseConstant.columnName];
    email = json[DatabaseConstant.columnEmail];
    mobileNo = json[DatabaseConstant.columnMobileNo];
    address = json[DatabaseConstant.columnAddress];
    image = json[DatabaseConstant.columnImage];
    status = json[DatabaseConstant.columnStatus];
    created = json[DatabaseConstant.columnCreated];
    updated = json[DatabaseConstant.columnUpdated];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DatabaseConstant.columnUserId] = userId;
    data[DatabaseConstant.columnUsername] = username;
    data[DatabaseConstant.columnName] = name;
    data[DatabaseConstant.columnEmail] = email;
    data[DatabaseConstant.columnMobileNo] = mobileNo;
    data[DatabaseConstant.columnAddress] = address;
    data[DatabaseConstant.columnImage] = image;
    data[DatabaseConstant.columnStatus] = status;
    data[DatabaseConstant.columnCreated] = created;
    data[DatabaseConstant.columnUpdated] = updated;
    return data;
  }
}
