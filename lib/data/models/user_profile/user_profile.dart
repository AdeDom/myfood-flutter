class UserProfile {
  String? userId;
  String? email;
  String? name;
  String? mobileNo;
  String? address;
  String? image;
  String? status;
  String? created;
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

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    address = json['address'];
    image = json['image'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['name'] = name;
    data['mobileNo'] = mobileNo;
    data['address'] = address;
    data['image'] = image;
    data['status'] = status;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}
