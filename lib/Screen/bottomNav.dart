import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:demo_projectapp/Model/User_Model.dart';
import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Routes/Routes_Name.dart';
import 'package:demo_projectapp/Screen/Home_Screen.dart';
import 'package:demo_projectapp/Screen/User_Profile_Screen.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
  });
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _bottomNavIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    FutureBuilder<UserModel>(
        future: UserViewModel().getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final user = snapshot.data!.data!;
            return UserProfileScreen(
              userid: user.user!.sId!,
              accessToken: user.accessToken!,
            );
          }
        }),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_bottomNavIndex),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: AppColors.pinkColor,
          shape: CircleBorder(),
          elevation: 20,
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.CreatePost);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: AppColors.pinkColor,
        splashColor: AppColors.whiteColor,
        icons: [
          Icons.home,
          Icons.person_2_outlined,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
