class UserFeeds {
  int? statusCode;
  String? type;
  List<UserFeed>? userFeed;

  UserFeeds({this.statusCode, this.type, this.userFeed});

  UserFeeds.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    type = json['type'];
    if (json['user_Feed'] != null) {
      userFeed = <UserFeed>[];
      json['user_Feed'].forEach((v) {
        userFeed!.add(new UserFeed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['type'] = this.type;
    if (this.userFeed != null) {
      data['user_Feed'] = this.userFeed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserFeed {
  UserPosts? userPosts;
  UserData? userData;

  UserFeed({this.userPosts, this.userData});

  UserFeed.fromJson(Map<String, dynamic> json) {
    userPosts = json['UserPosts'] != null
        ? new UserPosts.fromJson(json['UserPosts'])
        : null;
    userData = json['UserData'] != null
        ? new UserData.fromJson(json['UserData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userPosts != null) {
      data['UserPosts'] = this.userPosts!.toJson();
    }
    if (this.userData != null) {
      data['UserData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserPosts {
  String? sId;
  String? userId;
  String? url;
  String? mediaType;
  String? caption;
  int? likeCount;
  int? commentCount;
  String? createdAt;
  bool? isLiked;

  UserPosts(
      {this.sId,
      this.userId,
      this.url,
      this.mediaType,
      this.caption,
      this.likeCount,
      this.commentCount,
      this.createdAt,
      this.isLiked});

  UserPosts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    url = json['url'];
    mediaType = json['mediaType'];
    caption = json['caption'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    createdAt = json['createdAt'];
    isLiked = json['isLiked'];
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
    data['createdAt'] = this.createdAt;
    data['isLiked'] = this.isLiked;
    return data;
  }
}

class UserData {
  String? sId;
  String? username;
  String? email;
  String? fullName;
  String? profilePic;

  UserData(
      {this.sId, this.username, this.email, this.fullName, this.profilePic});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    fullName = json['fullName'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
