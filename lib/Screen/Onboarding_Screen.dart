import 'package:demo_projectapp/Screen/Login_Screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Welcome to My App',
      description: 'This is a description of the first screen.',
      imageUrl: 'assets/instagram_image.png',
    ),
    OnboardingItem(
      title: 'Explore Features',
      description: 'Learn about all the amazing features of our app.',
      imageUrl: 'assets/insta3_image.jpeg',
    ),
    OnboardingItem(
      title: 'Get Started',
      description: 'It\'s time to get started and enjoy our app!',
      imageUrl: 'assets/insta_image.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingItems.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  item: onboardingItems[index],
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          SizedBox(height: 20.0),
          if (_currentPage == onboardingItems.length - 1)
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
              },
              child: Text('Get Started'),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < onboardingItems.length; i++) {
      indicators.add(_buildPageIndicatorItem(i == _currentPage));
    }
    return indicators;
  }

  Widget _buildPageIndicatorItem(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: isActive ? 12.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  OnboardingPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          item.imageUrl,
          height: 300.0,
        ),
        SizedBox(height: 20.0),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
