class Search_User_Model {
  int? statusCode;
  String? type;
  List<Data>? data;

  Search_User_Model({this.statusCode, this.type, this.data});

  Search_User_Model.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    type = json['type'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? username;
  String? email;

  Data({this.sId, this.username, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
