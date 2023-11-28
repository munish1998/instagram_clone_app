class get_post_model {
  int? statusCode;
  String? type;
  Data? data;

  get_post_model({this.statusCode, this.type, this.data});

  get_post_model.fromJson(Map<String, dynamic> json) {
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
  List<Posts>? posts;

  Data({this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Posts'] != null) {
      posts = <Posts>[];
      json['Posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['Posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? sId;
  String? userId;
  String? url;
  String? mediaType;
  String? caption;
  int? likeCount;
  int? commentCount;
  bool? postStatus;
  String? createdAt;

  Posts(
      {this.sId,
      this.userId,
      this.url,
      this.mediaType,
      this.caption,
      this.likeCount,
      this.commentCount,
      this.postStatus,
      this.createdAt});

  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    url = json['url'];
    mediaType = json['mediaType'];
    caption = json['caption'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    postStatus = json['postStatus'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['url'] = this.url;
    data['mediaType'] = this.mediaType;
    data['caption'] = this.caption;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['postStatus'] = this.postStatus;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
