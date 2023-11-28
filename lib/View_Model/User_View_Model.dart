import 'package:demo_projectapp/Model/User_Model.dart' as md;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/User_Profile_Model.dart';
import '../Repository/Auth_Repository.dart';

class UserViewModel with ChangeNotifier {

  Future<bool?> saveUser(md.Data user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('accessToken', user.accessToken.toString());
    sp.setString('userName', user.user!.username.toString());
    sp.setString('email', user.user!.email.toString());
    sp.setString('_id', user.user!.sId.toString());
    notifyListeners();
    return true;
  }

  Future<md.UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? accessToken = sp.getString('accessToken');
    final String? userName = await sp.getString('userName');
    final String? email = await sp.getString('email');
    final String? sId = await sp.getString('_id');
    notifyListeners();
    return md.UserModel(
      data: md.Data(
          accessToken: accessToken.toString(),
          user: md.User(
            sId: sId.toString(),
            username: userName.toString(),
            email: email.toString(),
          )),
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('accessToken');
    // notifyListeners();
    return true;
  }

  static String? token, userID,username;

  getUserId() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    userID = await sp.getString('_id');
  }

  getAccessToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    token = await sp.getString('accessToken');
  }

 getusername() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    username = await sp.getString('userName');
  }

  int count = 0;
  UserProfile? res;
  Future<UserProfile?> getMyProfile (String userid) async {
    // await getUserId();
    await getAccessToken();
    await AuthRepository().userprofile( userId: userid,accessToken: token!).then((value){
      debugPrint("Profile Fetched in provider $value");
      res = value;
    }).onError((error, stackTrace){
      debugPrint("Profile Fetched error in provider $error");
    });
    if(count != 0) {   count++;}
    else {
    //  notifyListeners();
    }

    return res;
  }


  @override
  void dispose() {
    count = 0;
    res = null;
    super.dispose();
  }
}

