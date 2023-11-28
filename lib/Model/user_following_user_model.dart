class user_following_list {
  int? statusCode;
  String? type;
  Data? data;

  user_following_list({this.statusCode, this.type, this.data});

  user_following_list.fromJson(Map<String, dynamic> json) {
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
  List<Following>? following;

  Data({this.following});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Following'] != null) {
      following = <Following>[];
      json['Following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.following != null) {
      data['Following'] = this.following!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Following {
  User? user;

  Following({this.user});

  Following.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? email;
  int? accountVerify;

  User({this.sId, this.username, this.email, this.accountVerify});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    accountVerify = json['accountVerify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['accountVerify'] = this.accountVerify;
    return data;
  }
}
