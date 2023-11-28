import 'package:demo_projectapp/Routes/Routes_Name.dart';
import 'package:demo_projectapp/Screen/Comment_Screen.dart';
import 'package:demo_projectapp/Screen/Create_Password.dart';
import 'package:demo_projectapp/Screen/Create_Post.dart';
import 'package:demo_projectapp/Screen/Forget_Password_Screen.dart';
import 'package:demo_projectapp/Screen/Home_Screen.dart';
import 'package:demo_projectapp/Screen/Login_Screen.dart';
import 'package:demo_projectapp/Screen/Otp_Verification.dart';
import 'package:demo_projectapp/Screen/SignUp_Otp_Verification.dart';
import 'package:demo_projectapp/Screen/Signup_Screen.dart';
import 'package:demo_projectapp/Screen/Splash_Screen.dart';
import 'package:demo_projectapp/Screen/bottomNav.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.SplashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      case RoutesName.SignUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());

      case RoutesName.HomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

           
      // case RoutesName.EditProfile:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => EditProfile(
      //             title: 'app',
      //           ));

      case RoutesName.ForgetPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => ForgetPassword());

      case RoutesName.CreatePost:
        return MaterialPageRoute(
            builder: (BuildContext context) => CreatePost(
                  title: 'h',
                ));

      // case RoutesName.UserProfileScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => UserProfileScreen());

      case RoutesName.OtpVerification:
        Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) => OtpVerification(
                  email: otp["email"],
                ));

      case RoutesName.CreatePassword:
        Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) => CreatePassword(
                  forgetToken: otp['forgetToken'],
                ));

      case RoutesName.SignUp_Otp_Verification:
        Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                SignupOtpVerification(email: otp["email"]));

      case RoutesName.ResendOtp:
        Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                SignupOtpVerification(email: otp["email"]));
      case RoutesName.forgetverifyotp:
        Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                SignupOtpVerification(email: otp["email"]));

      case RoutesName.OtpVerification:
        Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                SignupOtpVerification(email: otp["email"]));

      case RoutesName.CommentList:
        return MaterialPageRoute(
            builder: (BuildContext context) => CommentScreen());

      case RoutesName.bottomNav:
        return MaterialPageRoute(builder:  (context) => BottomNavigation());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
  
}
