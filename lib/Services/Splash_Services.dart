
import 'package:demo_projectapp/Model/User_Model.dart';
import 'package:demo_projectapp/Screen/Login_Screen.dart';
import 'package:demo_projectapp/Screen/bottomNav.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class SplashServices {

  Future<UserModel> getUserDate() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{

      print(value.data!.accessToken.toString());

      if(value.data!.accessToken == 'null' || value.data!.accessToken == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
        //Navigator.pushNamed(context, RoutesName.login);
      }else {
        await  Future.delayed(Duration(seconds: 3));
        Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavigation()));
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}