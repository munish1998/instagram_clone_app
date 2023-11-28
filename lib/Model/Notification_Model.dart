class Notification_model {
  int? statusCode;
  String? type;
  List<Data>? data;

  Notification_model({this.statusCode, this.type, this.data});

  Notification_model.fromJson(Map<String, dynamic> json) {
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
  String? activityId;
  String? status;
  String? type;
  String? title;
  String? message;
  String? image;
  int? iV;

  Data(
      {this.sId,
      this.activityId,
      this.status,
      this.type,
      this.title,
      this.message,
      this.image,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    activityId = json['activityId'];
    status = json['status'];
    type = json['type'];
    title = json['title'];
    message = json['message'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['activityId'] = this.activityId;
    data['status'] = this.status;
    data['type'] = this.type;
    data['title'] = this.title;
    data['message'] = this.message;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
