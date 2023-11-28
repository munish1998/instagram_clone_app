// // // import 'package:flutter/material.dart';

// // // class TutorialScreen extends StatefulWidget {
// // //   const TutorialScreen({super.key});

// // //   @override
// // //   State<TutorialScreen> createState() => _TutorialScreenState();
// // // }

// // // class _TutorialScreenState extends State<TutorialScreen> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       // body: ,
// // //     );
// // //   }
// // // }


// // import 'package:demo_projectapp/Constants.dart';
// // import 'package:demo_projectapp/Model/slider.dart';
// // import 'package:demo_projectapp/Widgets/Slider_item.dart';
// // import 'package:demo_projectapp/Widgets/get_started_button.dart';
// // import 'package:flutter/cupertino.dart';


// // class OnBoardingLayoutView extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() => _OnBoardingLayoutView();
// // }

// // class _OnBoardingLayoutView extends State<OnBoardingLayoutView> {
// //   int _currentPage = 0;
// //   final PageController _pageController = PageController(initialPage: 0);

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     _pageController.dispose();
// //   }

// //   _onPageChanged(int index) {
// //     setState(() {
// //       _currentPage = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) => SliderLayout();

// //   bool inFinalPage() {
// //     if (_currentPage == sliderArrayList.length - 1) {
// //       return true;
// //     }
// //     return false;
// //   }

// //   Widget SliderLayout() => Container(
// //         child: Stack(
// //           children: <Widget>[
// //             Padding(
// //               padding: EdgeInsets.only(
// //                   top: MediaQuery.of(context).size.height * 0.17),
// //               child: PageView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 controller: _pageController,
// //                 onPageChanged: _onPageChanged,
// //                 itemCount: sliderArrayList.length,
// //                 itemBuilder: (ctx, i) => SlideItem(i),
// //               ),
// //             ),
// //             Column(
// //               children: <Widget>[
// //                 Align(
// //                   alignment: Alignment.topLeft,
// //                   child: Padding(
// //                     padding: EdgeInsets.only(
// //                         left: 25.0,
// //                         top: MediaQuery.of(context).size.width * 0.12),
// //                     child: Text(
// //                       inFinalPage() ? "" : Constants.SKIP,
// //                       style: TextStyle(
// //                         fontFamily: Constants.OPEN_SANS,
// //                         fontWeight: FontWeight.w700,
// //                         fontSize: 13.0,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Container(
// //                   alignment: AlignmentDirectional.center,
// //                   margin: EdgeInsets.only(
// //                       bottom: 0.0,
// //                       top: MediaQuery.of(context).size.height * 0.28),
// //                   child: inFinalPage()
// //                       ? GetStartedButton()
// //                       : Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: <Widget>[
// //                             for (int i = 0; i < sliderArrayList.length; i++)
// //                               if (i == _currentPage)
// //                                 SlideItem(1)
// //                               else
// //                                 SlideItem(1)
// //                           ],
// //                         ),
// //                 ),
// //               ],
// //             )
// //           ],
// //         ),
// //       );
// // }

// // class SlideDots {
// // }

// import 'package:flutter/material.dart';
// import 'package:animated_onboarding/components/fading_sliding_widget.dart';

// class WelcomePage extends StatefulWidget {
//   @override
//   _WelcomeState createState() => _WelcomeState();
// }

// class _WelcomeState extends State<WelcomePage>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1700),
//     )..forward();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: <Widget>[
//         Positioned.fill(
//           child: Image.asset(
//             'assets/images/background.png',
//             fit: BoxFit.fill,
//           ),
//         ),
//         Positioned(
//           child: Container(
//             height: width * 0.1,
//             width: width * 0.1,
//             decoration: ShapeDecoration(
//                 shape: CircleBorder(),
//                 gradient: LinearGradient(
//                   colors: [
//                     const Color(0xFF00FFDC),
//                     const Color(0xFF5096FE),
//                   ],
//                 )),
//           ),
//           top: 100,
//           left: 20,
//         ),
//         Positioned(
//           top: height * 0.2,
//           child: Column(
//             children: <Widget>[
//               ScaleTransition(
//                 scale: _animationController.drive(
//                   Tween<double>(begin: 0.3, end: 1.0).chain(
//                     CurveTween(
//                       curve: Interval(0.0, 0.2, curve: Curves.elasticInOut),
//                     ),
//                   ),
//                 ),
//                 child: FadeTransition(
//                   opacity: _animationController.drive(
//                     Tween<double>(begin: 0.0, end: 1.0).chain(
//                       CurveTween(
//                         curve: Interval(0.2, 0.4, curve: Curves.decelerate),
//                       ),
//                     ),
//                   ),
//                   child: ScaleTransition(
//                     scale: _animationController.drive(
//                       Tween<double>(begin: 1.3, end: 1.0).chain(
//                         CurveTween(
//                           curve: Interval(0.2, 0.4, curve: Curves.elasticInOut),
//                         ),
//                       ),
//                     ),
//                     child: Container(
//                       width: width * 0.3,
//                       height: width * 0.3,
//                       decoration: ShapeDecoration(
//                         color: const Color(0xFFFFFFFF),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(width * 0.08),
//                         ),
//                       ),
//                       child: Image.asset(
//                         'assets/images/video.png',
//                         scale: 0.9,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.04,
//               ),
//               FadingSlidingWidget(
//                 animationController: _animationController,
//                 interval: const Interval(0.5, 0.9),
//                 child: Text(
//                   'Zoomie',
//                   style: TextStyle(
//                     color: const Color(0xFFFFFFFF),
//                     fontSize: width * 0.08,
//                     fontFamily: 'ProductbSans',
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.2,
//               ),
//               Container(
//                 width: width * 0.9,
//                 child: FadingSlidingWidget(
//                   animationController: _animationController,
//                   interval: const Interval(0.7, 1.0),
//                   child: Text(
//                     'Discover and share the fun around you',
//                     style: TextStyle(
//                       color: const Color(0xFFFFFFFF),
//                       fontSize: width * 0.056,
//                       fontFamily: 'ProductSans',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }