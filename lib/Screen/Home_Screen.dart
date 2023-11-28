import 'package:demo_projectapp/Model/Likes_Model.dart';
import 'package:demo_projectapp/Model/User_Commenrts_Model.dart';
import 'package:demo_projectapp/Model/User_Model.dart';
import 'package:demo_projectapp/Model/feed_user_model.dart';
import 'package:demo_projectapp/Provider/Like_Provider.dart';
import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/Screen/Login_Screen.dart';
import 'package:demo_projectapp/Screen/Notification_Screen.dart';
import 'package:demo_projectapp/Screen/Search_Screen.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: UserViewModel().getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final user = snapshot.data!.data!;
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Image.asset(
                'assets/insta_image.png',
                scale: 23,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SearchScreen(
                                  accessToken: user.accessToken!,
                                )));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications_off_outlined),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NotificationScreen(
                                  accessToken: user.accessToken!,
                                )));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    // authViewMode.logout(, context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                SafeArea(
                  child: SizedBox(
                    height: 640,
                    child: FutureBuilder(
                        future: AuthViewModel()
                            .userfeed(context, user.accessToken!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            if (snapshot.hasData) {
                              UserFeeds? userData =
                                  UserFeeds.fromJson(snapshot.data!);
                              if (snapshot.data != null) {
                              } else {}
                              return ListView.builder(
                                itemCount: userData.userFeed!.length,
                                itemBuilder: (context, index) {
                                  return PostWidget(
                                    userData: userData,
                                    accessToken: user.accessToken!,
                                    myUsername: user.user!.username!,
                                    imageUrl: userData
                                        .userFeed![index].userPosts!.url!,
                                    desc: userData
                                        .userFeed![index].userPosts!.caption!,
                                    index: index,
                                    user: user.accessToken!,
                                    likeCount: userData
                                        .userFeed![index].userPosts!.likeCount
                                        .toString(),
                                    commentCount: userData.userFeed![index]
                                        .userPosts!.commentCount
                                        .toString(),
                                    userName: userData
                                        .userFeed![index].userData!.username
                                        .toString(),
                                    postId: userData
                                        .userFeed![index].userPosts!.sId!,
                                  );
                                },
                              );
                            } else {
                              return Text("No Data");
                            }
                          }
                        }),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class PostWidget extends StatelessWidget {
  final UserFeeds userData;
  final String accessToken;
  final String myUsername;
  final String imageUrl;
  final String desc;
  final int index;
  final String user;
  final String likeCount;
  final String commentCount;
  final String userName;
  final String postId;

  const PostWidget(
      {super.key,
      required this.userData,
      required this.myUsername,
      required this.accessToken,
      required this.imageUrl,
      required this.desc,
      required this.index,
      required this.user,
      required this.likeCount,
      required this.commentCount,
      required this.userName,
      required this.postId});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentcontroller = TextEditingController();
    final authViewMode = Provider.of<AuthViewModel>(context);
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage:
                NetworkImage(userData.userFeed![index].userData!.profilePic!),
          ),
          title: Text(
            userName,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            userData.userFeed![index].userData!.email.toString(),
            style: TextStyle(color: Colors.white),
          ),
          trailing: InkWell(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(),
                        child: Container(
                          height: 200,
                          child: Column(
                            children: [
                              if (userData
                                      .userFeed![index].userData!.username ==
                                  myUsername)
                                ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit Post'),
                                  onTap: () {
                                    showBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          TextEditingController
                                              captionController =
                                              TextEditingController();
                                          return Card(
                                            elevation: 50,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 100),
                                              child: Container(
                                                height: 200,
                                                child: Column(children: [
                                                  Container(
                                                    //width: 300,
                                                    height: 30,
                                                    child: TextField(
                                                      controller:
                                                          captionController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'caption...'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Button(
                                                    title: 'submit',
                                                    onPress: () {
                                                      Map data = {
                                                        "caption":
                                                            captionController
                                                                .text
                                                                .toString(),
                                                      };
                                                      authViewMode.editPost(
                                                          context,
                                                          accessToken,
                                                          data,
                                                          postId);
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ]),
                                              ),
                                            ),
                                          );
                                        });
                                    Navigator.pop(context);
                                  },
                                ),
                              if (userData
                                      .userFeed![index].userData!.username ==
                                  myUsername)
                                ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('delete post'),
                                  onTap: () {
                                    print('postid=$postId');
                                    authViewMode.deletepost(
                                      context,
                                      accessToken,
                                      postId,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              if (userData
                                      .userFeed![index].userData!.username !=
                                  myUsername)
                                ListTile(
                                    leading: Icon(Icons.report),
                                    title: Text('Report post'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 200,
                                            child: AlertDialog(
                                              title: Text('Report Post'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        'Do you want to report this post?'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                InkWell(
                                                  child: Text('Cancel'),
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                InkWell(
                                                  child: Text('Report'),
                                                  onTap: () {
                                                    authViewMode.reportpost(
                                                        context,
                                                        accessToken,
                                                        postId);
                                                    //  Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ),
        Container(
            width: 420,
            height: 350,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            )),
        Row(
          children: [
            Consumer<LikeProvider>(builder: (context, likeProvider, child) {
              final isRed = likeProvider.isLiked(postId);
              return InkWell(
                  onLongPress: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              Expanded(
                                child: FutureBuilder(
                                  future: AuthViewModel().userlistlikes(
                                      context, accessToken, postId),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child:
                                              const CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      print('postid=$postId');
                                      ApiResponseLikesModel likemodel =
                                          ApiResponseLikesModel.fromJson(
                                              snapshot.data);
                                      return ListView.builder(
                                        itemCount: likemodel.data.likes.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: CircleAvatar(
                                              // User profile image
                                              backgroundImage: NetworkImage(
                                                  likemodel.data.likes[index]
                                                      .user.profilePic),
                                            ),
                                            title: Text(likemodel.data
                                                .likes[index].user.username),
                                            subtitle: Text(likemodel
                                                .data.likes[index].user.email),
                                          );
                                        },
                                      );
                                    } else {
                                      return Text('No Data');
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  onTap: () {
                    Map data = {
                      "receiverId": userData.userFeed![index].userData!.sId!,
                      "activityId": userData.userFeed![index].userPosts!.sId,
                      "type": "LIKE"
                    };
                    likeProvider.toggleLike(postId);
                    if (isRed) {
                      authViewMode.userdislike(
                          context, accessToken, data, postId);
                    } else {
                      authViewMode.userlike(context, accessToken, postId);
                      authViewMode.notification(
                          context,
                          userData.userFeed![index].userData!.sId!,
                          userData.userFeed![index].userPosts!.sId!);
                    }
                  },
                  child: isRed
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ));
            }),

            Text(
              userData.userFeed![index].userPosts!.likeCount.toString(),
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(
                Icons.mode_comment_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Expanded(
                            child: FutureBuilder(
                              future: AuthViewModel()
                                  .commentsuser(context, accessToken, postId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: const CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  if (snapshot.hasData) {
                                    print('postid=$postId');
                                    CommentsModel commentsModel =
                                        CommentsModel.fromJson(snapshot.data);
                                    List<Comment> commentsList =
                                        commentsModel.data.comments;

                                    return ListView.builder(
                                      itemCount: commentsList.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            // User profile image
                                            backgroundImage: NetworkImage(
                                                commentsList[index]
                                                    .user
                                                    .profilePicture),
                                          ),
                                          title: Text(commentsList[index]
                                              .user
                                              .username),
                                          subtitle:
                                              Text(commentsList[index].comment),
                                          //trailing: Icon(Icons.edit),
                                        );
                                      },
                                    );
                                  } else {
                                    return Text('No Data');
                                  }
                                }
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: commentcontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Add a comment...',
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {
                                    Map data = {
                                      "comment":
                                          commentcontroller.text.toString(),
                                      "postId": userData
                                          .userFeed![index].userPosts!.sId!
                                    };
                                    authViewMode.commentpost(
                                        data, context, accessToken);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              },
            ),
            Text(
              userData.userFeed![index].userPosts!.commentCount.toString(),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 140),
            // IconButton(
            //   icon: Icon(CupertinoIcons.cloud_download),
            //   onPressed: () {},
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                userData.userFeed![index].userPosts!.caption!,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
