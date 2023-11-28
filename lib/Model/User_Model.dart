class UserModel{
  int? statusCode;
  String? type;
  Data? data;

  UserModel({this.statusCode, this.type, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    type = json['type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? userId;

  Data({this.user, this.accessToken, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
     userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
     data['userId'] = this.userId;
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? email;
  String? password;
  int? accountVerify;
  int? followerCount;
  int? followingCount;
  int? postCount;
  String? createdAt;
  int? iV;

  User(
      {this.sId,
      this.username,
      this.email,
      this.password,
      this.accountVerify,
      this.followerCount,
      this.followingCount,
      this.postCount,
      this.createdAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    accountVerify = json['accountVerify'];
    followerCount = json['followerCount'];
    followingCount = json['followingCount'];
    postCount = json['postCount'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['accountVerify'] = this.accountVerify;
    data['followerCount'] = this.followerCount;
    data['followingCount'] = this.followingCount;
    data['postCount'] = this.postCount;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
