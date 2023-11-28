class Edit_Profile_Model {
  int? statusCode;
  String? type;

  Edit_Profile_Model({this.statusCode, this.type});

  Edit_Profile_Model.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['type'] = this.type;
    return data;
  }
}
