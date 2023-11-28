import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}
class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
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
              'Forgot Password',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Enter the email address with your account we will send an email with confirmation to reset your password.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26),
            ),
            SizedBox(height: 25),
            Container(
              width: 350,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: AppColors.blueColor,
                    )),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Button(
                  title: 'Send otp',
                  onPress: () {
                    Map<String, dynamic> data = {
                      'email': emailController.text.toString().trim(),
                    };
                    authViewMode.ForgetPassword(data, context);
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
