import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/Res/components/Custom_TextFormField.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePassword extends StatefulWidget {
  final String forgetToken;
  const CreatePassword({super.key, required this.forgetToken});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController passCotroller = TextEditingController();
  TextEditingController confirmpassCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 90, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(
              'assets/forget_image.png',
              scale: 3,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              'Create New Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'This Password Should be different from previous one.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
                control: passCotroller,
                label: 'New Password',
                icons: Icons.password_rounded,
                val: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                    return 'enter correct password';
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
                control: confirmpassCotroller,
                label: 'Confirm Password',
                icons: Icons.password_rounded,
                val: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                    return 'enter correct password';
                  } else {
                    return null;
                  }
                }),
            SizedBox(height: 25),
            Center(
              child: Button(
                  title: 'Reset Password',
                  onPress: () {
                    Map data = {
                      "newPassword": passCotroller.text.toString(),
                    };
                    authViewMode.resetpassword(
                        data, context, widget.forgetToken);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
