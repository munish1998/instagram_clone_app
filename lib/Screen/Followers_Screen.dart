import 'package:demo_projectapp/Model/User_Followerlist_model.dart';
import 'package:demo_projectapp/Model/user_following_user_model.dart';
import 'package:demo_projectapp/Screen/User_Profile_Screen.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FollowingFollowersScreen extends StatefulWidget {
  String accessToken;
  String userId;
  FollowingFollowersScreen(
      {super.key, required this.accessToken, required this.userId});
  @override
  State<FollowingFollowersScreen> createState() =>
      _FollowingFollowersScreenState();
}
class _FollowingFollowersScreenState extends State<FollowingFollowersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    //print('${widget.accessToken},${widget.userId}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: 'Follower',
          ),
          Tab(
            text: 'Following',
          ),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        FutureBuilder(
            future: authViewModel.userfollowerslist(
                context, widget.accessToken, widget.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final querydata = snapshot.data;
                final users = user_followers_list.fromJson(querydata);
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: users.data!.followers!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserProfileScreen(
                              userid: users.data!.followers![index].user!.sId!,
                              accessToken: widget.accessToken,
                            );
                          }));
                        },
                        leading: CircleAvatar(),
                        title:
                            Text(users.data!.followers![index].user!.username!),
                      );
                    },
                  );
                } else {
                  return Text('No Data');
                }
              }
            }),
        FutureBuilder(
            future: authViewModel.userfollowinglist(
                context, widget.accessToken, widget.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final querydata = snapshot.data;
                final users = user_following_list.fromJson(querydata);
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: users.data!.following!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserProfileScreen(
                                userid:
                                    users.data!.following![index].user!.sId!,
                                accessToken: widget.accessToken);
                          }));
                        },
                        leading: CircleAvatar(),
                        title:
                            Text(users.data!.following![index].user!.username!),
                      );
                    },
                  );
                } else {
                  return Text('No Data');
                }
              }
            })
      ]),
    );
  }
}
