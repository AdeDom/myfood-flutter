class UserProfile {
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

  UserProfile({
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

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
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
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['mobileNo'] = mobileNo;
    data['address'] = address;
    data['image'] = image;
    data['status'] = status;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}
