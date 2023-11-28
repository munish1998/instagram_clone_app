import 'dart:convert';

import 'package:demo_projectapp/Data/Network/Base_Api_Services.dart';
import 'package:demo_projectapp/Data/Network/Network_Api_Services.dart';
import 'package:demo_projectapp/Model/User_Profile_Model.dart';
import 'package:demo_projectapp/Model/search_user_model.dart';
import 'package:demo_projectapp/Res/components/App_Url.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.loginEndPint, data, header: {
        "Content-Type": "application/json",
      });
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.SignUp, data, header: {
        "Authorization": "Basic c29jaWFsTWVkaWE6c29jaWFsQDEyMw==",
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> OtpVerification(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.forgetverifyotp, data, header: {
        "Authorization": "Basic c29jaWFsTWVkaWE6c29jaWFsQDEyMw==",
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SignupOtpVerification(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.SignupOtpVerification, data, header: {
        "Content-Type": "application/json",
      });
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> ForgetPasswordApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.ForgetPassword, data, header: {
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> ResendOtp(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.resendotp, data, header: {
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> forgetverifyotp(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.forgetverifyotp, data);
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> resetpassword(dynamic data, String forget) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.resetpassword, data, header: {
        "Authorization": "Bearer $forget",
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic> logout(dynamic data, String accessToken) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.logout, data, header: {
             "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> CreatePost(dynamic data, String accessToken) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.CreatePost, data, header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic> editPost(
      String accessToken, dynamic data, String postId) async {
    try {
      dynamic response = await _apiServices
          .getPatchApiResponse("${AppUrl.editPost}$postId", data, header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic> editProfile(String accessToken, dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPatchApiResponse(AppUrl.editprofile, data, header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Map<String, String> header = {
    "Authorization": "Bearer",
    "Content-Type": "application/json",
  };

  Future<UserProfile?> userprofile(
      {required String userId, required String accessToken}) async {
    header['Authorization'] = accessToken;

    UserProfile? response;
    await _apiServices
        .getGetApiResponse("${AppUrl.fetchProfileEndPoint}$userId",
            header: header)
        .then((value) {
      response = UserProfile.fromJson(value);
    }).onError((error, stackTrace) {
      debugPrint("Error in repo $error");
    });

    return response;
  }

  Map<String, String> header1 = {
    "Authorization": "Bearer",
    "Content-Type": "application/json",
  };

  Future<Search_User_Model?> usersearchname(
      {required String name, required String accessToken}) async {
    header['Authorization'] = accessToken;
    Search_User_Model? response;
    await _apiServices
        .getGetApiResponse("${AppUrl.fetchProfileEndPoint2}$name",
            header: header)
        .then((value) {
      response = Search_User_Model.fromJson(value);
    }).onError((error, stackTrace) {
      debugPrint("Error in repo $error");
    });

    return response;
  }

  Future<dynamic> UserFeed(String accessToken) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.userfeed,
          header: {
            "Content-Type": "application/json",
            'Authorization': accessToken
          });
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> usersearch(
    String accessToken,
    String name,
  ) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.fetchProfileEndPoint2}$name", header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userfollowerlist(
    String accessToken,
    String userId,
  ) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.userfollowerslist}$userId", header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userfollowinglist(
    String accessToken,
    String userId,
  ) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.userfollowinglist}$userId", header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }


  Future<dynamic> getpost(
    String accessToken,
    String userId,
  ) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.getpost}$userId", header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  

  Future<dynamic> commentpost(dynamic data, String accessToken) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrl.commentpost, data, header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> commentsuser(
    String accessToken,
    String postId,
  ) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.commentsuser}$postId", header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> reportpost(
    String accessToken,
    String postId,
  ) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          "${AppUrl.reportpost}$postId", accessToken,
          header: {
            "Authorization": "Bearer $accessToken",
            "Content-Type": "application/json",
          });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userlike(
    String accessToken,
    String postId,
  ) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          "${AppUrl.userlike}$postId", accessToken,
          header: {
            "Authorization": "Bearer $accessToken",
            "Content-Type": "application/json",
          });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> dislike(
      String accessToken, dynamic data, String postId) async {
    try {
      dynamic response = await _apiServices
          .getPatchApiResponse("${AppUrl.userdislike}$postId", data, header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userlistlikes(
    String accessToken,
    String postId,
  ) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.userlistlikes}$postId", header: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      });
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userfollow(String followUser, String accessToken) async {
    Map<String, dynamic> data = {
      "followingId": followUser,
    };
    debugPrint("Data for follow user in repo is $data");
    try {
      dynamic responses = await _apiServices
          .getPostApiResponse(AppUrl.userfollow, data, header: {
        "Authorization": accessToken,
        "Content-Type": "application/json",
      });
      debugPrint("Follow user response is ${jsonDecode(responses.body)}");
      return responses;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userunfollow(String accessToken, String followingId) async {
    Map<String, String> myHeader = {
      "Authorization": accessToken,
      "accept": "application/json",
    };
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          "${AppUrl.userunfollow}=$followingId", {},
          header: myHeader);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> deletepost(String accessToken, String postId) async {
    Map<String, String> myHeader = {
      "Authorization": accessToken,
      "accept": "application/json",
    };
    debugPrint("Url is ${AppUrl.deletepost}=${postId} \nHeader is $myHeader");
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          "${AppUrl.deletepost}$postId", {},
          header: myHeader);
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> notification(dynamic data, receiverId, activityid) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.notification, data, header: {
"Content-Type": "application/json",});
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> notificationget(String accessToken) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": accessToken
    };
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.notificationget, header: header);
      return response;
    } catch (e) {
      throw e;
    }
  }
   Future<dynamic> deletenotification(String accessToken, String notificationId) async {
    Map<String, String> myHeader = {
      "Authorization": accessToken,
      "accept": "application/json",
    };
    debugPrint("Url is ${AppUrl.deletenotification}=${notificationId} \nHeader is $myHeader");
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          "${AppUrl.deletepost}$notificationId", {},
          header: myHeader);
      print('munish');
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }
}
