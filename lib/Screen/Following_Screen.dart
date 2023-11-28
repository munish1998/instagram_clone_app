import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FollowingScreen(),
    );
  }
}

class FollowingScreen extends StatelessWidget {
  final List<String> followers = [
    'follower1',
    'follower2',
    'follower3',
    'follower4',
    'follower5',
    'follower6',
    'follower7',
    'follower1',
    'follower2',
    'follower3',
    'follower4',
    'follower5',
    'follower6',
    'follower7',
    'follower1',
    'follower2',
    'follower3',
    'follower4',
    'follower5',
    'follower6',
    'follower7',
    // Add more followers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
      ),
      body: ListView.builder(
        itemCount: followers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // You can replace this with the user's profile image
              backgroundColor: Colors.grey, 
            ),
            title: Text(followers[index]),
            trailing: ElevatedButton(
              child: Text('Followers'),
              onPressed: () {
                // Add functionality to follow/unfollow users here
              },
            ),
          );
        },
      ),
    );
  }
}
