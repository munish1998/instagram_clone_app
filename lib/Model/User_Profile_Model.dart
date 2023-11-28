class UserProfile {
  int? statusCode;
  String? type;
  Data? data;

  UserProfile({this.statusCode, this.type, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
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
  List<UserPofile>? userPofile;

  Data({this.userPofile});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['UserPofile'] != null) {
      userPofile = <UserPofile>[];
      json['UserPofile'].forEach((v) {
        userPofile!.add(new UserPofile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userPofile != null) {
      data['UserPofile'] = this.userPofile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserPofile {
  String? username;
  String? email;
  int? followerCount;
  int? followingCount;
  int? postCount;
  String? fullName;
  String? profileBio;
  String? profilePic;
  List<UserPosts>? userPosts;
  bool? isFollowing;
  bool? isFollower;

  UserPofile(
      {this.username,
      this.email,
      this.followerCount,
      this.followingCount,
      this.postCount,
      this.fullName,
      this.profileBio,
      this.profilePic,
      this.userPosts,
      this.isFollowing,
      this.isFollower});

  UserPofile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    followerCount = json['followerCount'];
    followingCount = json['followingCount'];
    postCount = json['postCount'];
    fullName = json['fullName'];
    profileBio = json['profileBio'];
    profilePic = json['profilePic'];
    if (json['UserPosts'] != null) {
      userPosts = <UserPosts>[];
      json['UserPosts'].forEach((v) {
        userPosts!.add(new UserPosts.fromJson(v));
      });
    }
    isFollowing = json['isFollowing'];
    isFollower = json['isFollower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['followerCount'] = this.followerCount;
    data['followingCount'] = this.followingCount;
    data['postCount'] = this.postCount;
    data['fullName'] = this.fullName;
    data['profileBio'] = this.profileBio;
    data['profilePic'] = this.profilePic;
    if (this.userPosts != null) {
      data['UserPosts'] = this.userPosts!.map((v) => v.toJson()).toList();
    }
    data['isFollowing'] = this.isFollowing;
    data['isFollower'] = this.isFollower;
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
