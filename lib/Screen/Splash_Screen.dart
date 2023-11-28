import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Services/Splash_Services.dart';
import 'package:demo_projectapp/main.dart';
import 'package:flutter/material.dart';
// import 'package:infoprofiledemo/res/app_images.dart';
// import 'package:infoprofiledemo/view_model/service/splash_service/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashService=SplashServices();
  @override
  void initState() {
    super.initState();
    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
        mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.whiteColor,
            //color: appcolor.SplashScreen_green,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 700,
                    width: 700,
                    child: Image.asset(
                      'assets/splash2_image.gif',fit:BoxFit.cover,filterQuality: FilterQuality.high,
                      scale: 0.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                   'Instagram App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}








// import 'package:demo_projectapp/Res/components/App_Colors.dart';
// import 'package:demo_projectapp/Screen/Onboarding_Screen.dart';
// import 'package:demo_projectapp/Services/Splash_Services.dart';
// import 'package:demo_projectapp/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//    SplashServices splashServices = SplashServices();
//   @override
//   void initState() {
//     super.initState();
//     // SplashServices. checkAuthentication(context);
//    // splashServices. checkAuthentication(context);
//     Future.delayed(Duration(seconds: 8), () {
      
//       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           systemNavigationBarColor: Colors.white));
//           Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()));
//       // if (FirebaseAuth.instance.currentUser != null) {
//       //   Navigator.pushReplacement(
//       //       context, MaterialPageRoute(builder: (_) => HomeScreen()));
//       // } else {
//       //   Navigator.pushReplacement(
//       //       context, MaterialPageRoute(builder: (_) => LoginScreen()));
//       // }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     mq = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             color: AppColors.whiteColor,
//             //color: appcolor.SplashScreen_green,
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Center(
//                   child: Container(
//                     height: 700,
//                     width: 700,
//                     child: Image.asset(
//                       'assets/splash2_image.gif',fit:BoxFit.cover,filterQuality: FilterQuality.high,
//                       scale: 0.5,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: Text(
//                    'Instagram App',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
