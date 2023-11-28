import 'package:demo_projectapp/Model/User_Model.dart';
import 'package:demo_projectapp/Repository/Auth_Repository.dart';
import 'package:demo_projectapp/Routes/Routes_Name.dart';
import 'package:demo_projectapp/Utils/Utils.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    await _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      await userPreference.saveUser(Data(
          accessToken: value["data"]["accessToken"],
          user: User(
            username: value["data"]["user"]["username"],
            email: value["data"]["user"]["email"],
            sId: value["data"]["user"]["_id"],
          )));

      Utils.snackBar('Login Successfully', context);
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RoutesName.bottomNav);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) {
      // var a=data['email'];
      setSignUpLoading(false);
      Utils.snackBar('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.SignUp_Otp_Verification,
          arguments: {"email": data["email"]});
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> SignupOtpVerification(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.SignupOtpVerification(data).then((value) {
      setSignUpLoading(false);
      Utils.snackBar('verification Successfully', context);
      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> ForgetPassword(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.ForgetPasswordApi(data).then((value) {
      print("Hello");
      setSignUpLoading(false);
      Utils.snackBar(' Send otp', context);
      Navigator.pushNamed(context, RoutesName.OtpVerification,
          arguments: {'email': data['email']});
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> resendotp(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.ResendOtp(data).then((value) {
      setLoading(false);
      // final userPreference = Provider.of<UserViewModel>(context , listen: false);
      // userPreference.saveUser(
      //   UserModel(
      //     token: value['token'].toString()
      //   )
      // );

      Utils.snackBar('Successfully', context);
      // Navigator.pushNamed(context, RoutesName.HomeScreen);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> OtpVerification(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.OtpVerification(data).then((value) {
      setLoading(false);
      // final userPreference = Provider.of<UserViewModel>(context , listen: false);
      // userPreference.saveUser(
      //   UserModel(
      //     token: value['token'].toString()
      //   )
      // );

      Utils.snackBar('otp  Successfully', context);
      Navigator.pushNamed(context, RoutesName.CreatePassword, arguments: {
        "forgetToken": value['data']['resetPasswordToken'],
      });
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> resetpassword(
      dynamic data, BuildContext context, String forget) async {
    setLoading(true);

    _myRepo.resetpassword(data, forget).then((value) {
      setLoading(false);
      // final userPreference = Provider.of<UserViewModel>(context , listen: false);
      // userPreference.saveUser(
      //   UserModel(
      //     token: value['token'].toString()
      //   )
      // );

      Utils.snackBar('reset password Successfully', context);
      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> logout(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.logout(context,data).then((value) {
      // var a=data['email'];
      setSignUpLoading(false);
      Utils.snackBar('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.SignUp_Otp_Verification,
          arguments: {"email": data["email"]});
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> CreatePost(
      dynamic data, BuildContext context, String accessToken) async {
    setLoading(true);

    _myRepo.CreatePost(data, accessToken).then((value) {
      setLoading(false);
        Navigator.pushNamed(context, RoutesName.bottomNav);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<dynamic> userProfile(
      BuildContext context, String userId, String accessToken) async {
    dynamic res;
    await _myRepo
        .userprofile(accessToken: accessToken, userId: userId)
        .then((value) {
      res = value;
      Utils.flushBarErrorMessage('profile create succeesfully', context);
      Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }

  Future<Map<String, dynamic>?> userfeed(
      BuildContext context, String accessToken) async {
    Map<String, dynamic>? res;
    await _myRepo.UserFeed(accessToken).then((value) {
      res = value;
    //  Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        print("Response is=====================" + value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }

  Future<dynamic> usersearch(
      BuildContext context, String accessToken, String username) async {
    dynamic res;
    await _myRepo.usersearch(accessToken,username).then((value) {
      res = value;
     // Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> userfollowerslist(
      BuildContext context, String accessToken, String userId) async {
    dynamic res;
    await _myRepo.userfollowerlist(accessToken,userId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }

  Future<dynamic> userfollowinglist(
      BuildContext context, String accessToken, String userId) async {
    dynamic res;
    await _myRepo.userfollowinglist(accessToken,userId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> editProfile(
      BuildContext context, String accessToken, dynamic data) async {
    dynamic res;
    await _myRepo.editProfile(accessToken,data).then((value) {
      res = value;
      Utils.flushBarErrorMessage(' edit profile succeesfully', context);
       Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> editPost(
      BuildContext context, String accessToken, dynamic data,String postId) async {
    dynamic res;
    await _myRepo.editPost(accessToken,data,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage(' post edit succeesfully', context);
       Navigator.pushNamed(context, RoutesName.HomeScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> getpost(
      BuildContext context, String accessToken, String userId) async {
    dynamic res;
    await _myRepo.getpost(accessToken,userId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> commentpost(dynamic data, BuildContext context,String accessToken) async {
    setSignUpLoading(true);

    _myRepo.commentpost(data,accessToken).then((value) {
      setSignUpLoading(false);
      // Utils.snackBar('verification Successfully', context);
      // Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
   Future<dynamic> commentsuser(
      BuildContext context, String accessToken, String postId) async {
    dynamic res;
    await _myRepo.commentsuser(accessToken,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
    Future<dynamic> reportpost(
      BuildContext context, String accessToken, String postId) async {
    dynamic res;
    await _myRepo.reportpost(accessToken,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  report post  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> userlike(
      BuildContext context, String accessToken, String postId) async {
    dynamic res;
    await _myRepo.userlike(accessToken,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  user like post', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> userdislike(
      BuildContext context, String accessToken, dynamic data,String postId) async {
    dynamic res;
    await _myRepo.dislike(accessToken,data,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  unlike post', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> userlistlikes(
      BuildContext context, String accessToken, String postId) async {
    dynamic res;
    await _myRepo.userlistlikes(accessToken,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> deletepost(
      BuildContext context, String accessToken,String postId) async {
    dynamic res;
    debugPrint("---------------->$postId to delete post");
    await _myRepo.deletepost(accessToken,postId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('post delete succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> notification(
      BuildContext context, String receiverId, String activityId) async {
    dynamic res;
    await _myRepo.notification(context,receiverId,activityId).then((value) {
      res = value;
      //Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> notificationget(
      BuildContext context, String accessToken) async {
    dynamic res;
    await _myRepo.notificationget(accessToken).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
   Future<dynamic> userfollow(
      BuildContext context, String followingId,String accessToken ) async {
    dynamic res;
    await _myRepo.userfollow(followingId,accessToken).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> userunfollow(
      BuildContext context, String accessToken,String followingId) async {
    dynamic res;
    await _myRepo.userunfollow(accessToken,followingId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('  succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
  Future<dynamic> deletenotification(
      BuildContext context, String accessToken,String notificationId) async {
    dynamic res;
    await _myRepo.deletenotification(accessToken,notificationId).then((value) {
      res = value;
      Utils.flushBarErrorMessage('post delete succeesfully', context);
      //  Navigator.pushNamed(context, RoutesName.UserProfileScreen);
      if (kDebugMode) {
        // print("Response is====================="+value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return res;
  }
}
