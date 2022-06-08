import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/user_profile/user_profile.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? mobileNo;

  @HiveField(4)
  String? address;

  @HiveField(5)
  String? image;

  @HiveField(6)
  String? status;

  @HiveField(7)
  String? created;

  @HiveField(8)
  String? updated;

  UserEntity({
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

  UserEntity.fromJson(Map<String, dynamic> json) {
    userId = json[DatabaseConstant.columnUserId];
    email = json[DatabaseConstant.columnEmail];
    name = json[DatabaseConstant.columnName];
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
    data[DatabaseConstant.columnEmail] = email;
    data[DatabaseConstant.columnName] = name;
    data[DatabaseConstant.columnMobileNo] = mobileNo;
    data[DatabaseConstant.columnAddress] = address;
    data[DatabaseConstant.columnImage] = image;
    data[DatabaseConstant.columnStatus] = status;
    data[DatabaseConstant.columnCreated] = created;
    data[DatabaseConstant.columnUpdated] = updated;
    return data;
  }

  UserProfile mapToUserProfile() {
    return UserProfile(
      userId: userId,
      email: email,
      name: name,
      mobileNo: mobileNo,
      address: address,
      image: image,
      status: status,
      created: created,
      updated: updated,
    );
  }
}
