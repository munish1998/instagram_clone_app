import 'dart:io';
import 'package:demo_projectapp/Model/User_Model.dart';
import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/Routes/Routes_Name.dart';
import 'package:demo_projectapp/Services/s3_image_url.dart';
import 'package:demo_projectapp/Utils/Utils.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key, required this.title});
  final String title;
  @override
  State<CreatePost> createState() => _CompleteProfile();
}

class _CompleteProfile extends State<CreatePost> {
  TextEditingController captionController = TextEditingController();
  File? image;

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

  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.bottomNav);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            ' Create Post',
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
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 50),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Divider(
                                      thickness: 3,
                                      endIndent: 160,
                                      indent: 160,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 30, left: 20),
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
                                      padding: EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                                child: InkWell(
                                                  onTap: () async {
                                                    Image1();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Icons.camera_alt_rounded,
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
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                                child: InkWell(
                                                  onTap: () async {
                                                    GalaryPicker();
                                                    Navigator.pop(context);
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
                      child: Center(
                        child: Container(
                          height: 350,
                          width: 350,
                          decoration: BoxDecoration(
                            color: AppColors.pinkColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.pinkColor,
                            backgroundImage: image != null
                                ? FileImage(image!) as ImageProvider
                                : const AssetImage(
                                    'assets/insta_image.png',
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                      controller: captionController,
                      decoration: InputDecoration(hintText: 'caption...'),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Button(
                    title: 'Submit',
                    onPress: () async {
                      if (image != null || captionController.text != "") {
                        var postimageurl = await S3Services()
                            .upload(file: image!, userid: user.accessToken!);
                        Map data = {
                          'url': postimageurl,
                          'mediaType': 'image',
                          'caption': captionController.text.toString().trim()
                        };
                        await authViewMode.CreatePost(
                            data, context, user.accessToken!);
                        Utils.flushBarErrorMessage(
                            'post create succeesfully', context);
                      }
                    },
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
