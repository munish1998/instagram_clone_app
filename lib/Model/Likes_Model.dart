class ApiResponseLikesModel {
  final int statusCode;
  final String type;
  final ApiResponseLikesData data;

  ApiResponseLikesModel({
    required this.statusCode,
    required this.type,
    required this.data,
  });

  factory ApiResponseLikesModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseLikesModel(
      statusCode: json['statusCode'],
      type: json['type'],
      data: ApiResponseLikesData.fromJson(json['data']),
    );
  }
}

class ApiResponseLikesData {
  final List<ApiResponseLike> likes;

  ApiResponseLikesData({
    required this.likes,
  });

  factory ApiResponseLikesData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> likesData = json['Likes'];

    final List<ApiResponseLike> likes = likesData
        .map((likeJson) => ApiResponseLike.fromJson(likeJson))
        .toList();

    return ApiResponseLikesData(
      likes: likes,
    );
  }
}

class ApiResponseLike {
  final ApiResponseUser user;

  ApiResponseLike({
    required this.user,
  });

  factory ApiResponseLike.fromJson(Map<String, dynamic> json) {
    return ApiResponseLike(
      user: ApiResponseUser.fromJson(json['User']),
    );
  }
}

class ApiResponseUser {
  final String id;
  final String username;
  final String email;
  final String profilePic;

  ApiResponseUser({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePic,
  });

  factory ApiResponseUser.fromJson(Map<String, dynamic> json) {
    return ApiResponseUser(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      profilePic: json['profilePic'],
    );
  }
}