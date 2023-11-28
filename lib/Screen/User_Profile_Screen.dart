import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Screen/Edit_Profile.dart';
import 'package:demo_projectapp/Screen/Followers_Screen.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserProfileScreen extends StatefulWidget {
  String userid;
  String accessToken;
  UserProfileScreen(
      {super.key, required this.userid, required this.accessToken});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print('hello');
    final authViewMode = Provider.of<AuthViewModel>(context);
    //final authViewModel=Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Profile Screen'),
        ),
        body: FutureBuilder(
            future: UserViewModel().getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('error: ${snapshot.error}');
              } else {
                final user = snapshot.data!.data!;
                return Consumer<UserViewModel>(builder: (context, pr, ch) {
                  return FutureBuilder(
                      future: pr.getMyProfile(widget.userid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.amber,
                                          backgroundImage: NetworkImage(pr
                                              .res!
                                              .data!
                                              .userPofile![0]
                                              .profilePic!)),
                                      Column(
                                        children: [
                                          Text(
                                            pr.res!.data!.userPofile![0]
                                                .postCount
                                                .toString(),
                                            style: TextStyle(
                                                color: AppColors.whiteColor),
                                          ),
                                          Text(
                                            "Posts",
                                            style: TextStyle(
                                                color: AppColors.whiteColor),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print(
                                              '${user.accessToken},${user.user!.sId}');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      FollowingFollowersScreen(
                                                        accessToken:
                                                            user.accessToken!,
                                                        userId: user.user!.sId!,
                                                      )));
                                        },
                                        child: Column(
                                          children: [
                                            Text(
                                              pr.res!.data!.userPofile![0]
                                                  .followerCount
                                                  .toString(),
                                              style: TextStyle(
                                                  color: AppColors.whiteColor),
                                            ),
                                            Text(
                                              "Followers",
                                              style: TextStyle(
                                                  color: AppColors.whiteColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (_) =>
                                          //             FollowingScreen()));
                                        },
                                        child: Column(
                                          children: [
                                            Text(
                                              pr.res!.data!.userPofile![0]
                                                  .followingCount
                                                  .toString(),
                                              style: TextStyle(
                                                  color: AppColors.whiteColor),
                                            ),
                                            Text(
                                              "Following",
                                              style: TextStyle(
                                                  color: AppColors.whiteColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        pr.res!.data!.userPofile![0].username
                                            .toString(),
                                        style: TextStyle(
                                            color: AppColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        pr.res!.data!.userPofile![0].profileBio
                                            .toString(),
                                        style: TextStyle(
                                            color: AppColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        if (user.user!.sId == widget.userid)
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            EditProfile(
                                                              title: 'h',
                                                              accessToken: user
                                                                  .accessToken!,
                                                              Bio: '',
                                                              data: user,
                                                            )));
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                width: 0.1,
                                                decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                    child: Text(
                                                  'edit profile',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                              ),
                                            ),
                                          ),
                                        if (user.user!.sId != widget.userid)
                                          Center(
                                              child: Container(
                                            height: 50,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                color: AppColors.blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  debugPrint(
                                                      " --------------------------------${pr.res!.data!.userPofile![0].isFollowing}");
                                                  if (pr
                                                      .res!
                                                      .data!
                                                      .userPofile![0]
                                                      .isFollowing!) {
                                                    authViewMode.userunfollow(
                                                        context,
                                                        widget.accessToken,
                                                        pr
                                                            .res!
                                                            .data!
                                                            .userPofile![0]
                                                            .userPosts![0]
                                                            .userId!);
                                                  } else {
                                                    authViewMode.userfollow(
                                                        context,
                                                        pr
                                                            .res!
                                                            .data!
                                                            .userPofile![0]
                                                            .userPosts![0]
                                                            .userId!,
                                                        widget.accessToken);
                                                  }
                                                },
                                                child: (pr
                                                            .res!
                                                            .data!
                                                            .userPofile![0]
                                                            .isFollowing ==
                                                        true)
                                                    ? Text('unFollow')
                                                    : Text('follow'),
                                              ),
                                            ),
                                          ))
                                      ],
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    //itemCount: 1,
                                    itemCount:
                                        pr.res!.data!.userPofile![0].postCount,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            // color: AppColors.pinkColor,
                                            //shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.whiteColor)),
                                        // child: Image.asset(
                                        //   'assets/kohli_image.png',
                                        //   fit: BoxFit.cover,
                                        // ),
                                        child: Image.network(
                                          pr.res!.data!.userPofile![0]
                                              .userPosts![index].url!,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Text("No Data");
                          }
                        }
                      });
                });
              }
            }));
  }
}

 //child: !(pr.res!.data!.userPofile![0].isFollower==true)?Text('Follow'):Text('Unfollow ${pr.res!.data!.userPofile![0].isFollower}'),


