import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpVerification extends StatefulWidget {
  final String email;
  const OtpVerification({super.key, required this.email});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  // TextEditingController controller1=TextEditingController();
  // TextEditingController controller2=TextEditingController();
  // TextEditingController controller3=TextEditingController();
  // TextEditingController controller4=TextEditingController();
  // FocusNode controller11=FocusNode();
  // FocusNode controller22=FocusNode();
  // FocusNode controller33=FocusNode();
  // FocusNode controller44=FocusNode();

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 130, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'assets/otp_image.png',
                scale: 3,
              )),
              SizedBox(
                height: 40,
              ),
              Text(
                'Please Check Your Email',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'We Have Send the code.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Color(0xFF512DA8),
                 
                    showFieldAsBox: true,
                  
                    onCodeChanged: (String code) {
                
                    },
                
                    onSubmit: (String verificationCode) {
                      Map data={
                        "email":widget.email,
                        "otp":verificationCode
                      };
                      authViewMode.OtpVerification(data, context);
                    }, 
                  ),                  
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Button(
                    title: 'Verify otp',
                    onPress: () {
                      
                      
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
