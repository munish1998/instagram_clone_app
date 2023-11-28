import 'dart:io';
import 'package:demo_projectapp/Model/User_Model.dart';
import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/Services/s3_image_url.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final String accessToken;
  final String Bio;
  final data;

  final String title;
  EditProfile(
      {super.key,
      required this.title,
      required this.accessToken,
      required this.Bio,
      required this.data});
  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  File? image;
  File? pickedImage;
  Future Image1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final imageTemp = File(image.path);
    setState(() {
      this.image = imageTemp;
    });

  }

  Future GalaryPicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final Galarytemp = File(image.path);
    setState(() {
      this.image = Galarytemp;
    });
  }
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
     final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            ' Edit Profile',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: AppColors.pinkColor),
      body: FutureBuilder<UserModel>(
          future: UserViewModel().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final user = snapshot.data!.data!;
              return SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 50),
                          child: Center(
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: AppColors.pinkColor,
                              backgroundImage: image != null
                                  ? FileImage(image!) as ImageProvider
                                  : const AssetImage(
                                      'assets/insta_image.png',
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 170,
                          left: 220,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blueColor,
                            ),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Divider(
                                              thickness: 3,
                                              endIndent: 160,
                                              indent: 160,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 30, left: 20),
                                              child: Text(
                                                'profile photo',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            Image1();
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .camera_alt_rounded,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Camera'),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 45,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            GalaryPicker();
                                                          },
                                                          child: Icon(
                                                            Icons.image,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Gallery'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                   
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                      title: 'Submit',
                      onPress: () async {
                       
                          var postimageurl = await S3Services()
                              .upload(file: image!, userid: user.accessToken!);
                          Map data = {
                            "fullName": user.user!.username!,
                            "profilePic": postimageurl,
                            "profileBio": " hlooo munish"
                          };
                        
                    // ignore: use_build_context_synchronously
                    authViewMode.editProfile(context, widget.accessToken, data);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                           
                      },
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
