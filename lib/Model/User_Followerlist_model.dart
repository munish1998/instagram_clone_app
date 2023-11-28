class user_followers_list {
  int? statusCode;
  String? type;
  Data? data;

  user_followers_list({this.statusCode, this.type, this.data});

  user_followers_list.fromJson(Map<String, dynamic> json) {
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
  List<Followers>? followers;

  Data({this.followers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Followers'] != null) {
      followers = <Followers>[];
      json['Followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.followers != null) {
      data['Followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followers {
  User? user;

  Followers({this.user});

  Followers.fromJson(Map<String, dynamic> json) {
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
