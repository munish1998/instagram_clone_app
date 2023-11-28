import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/Screen/Login_Screen.dart';
import 'package:demo_projectapp/Utils/Utils.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode=FocusNode();
     final FocusNode _emailFocusNode=FocusNode();
  final FocusNode _passwordFocusNode=FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _usernameFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
     
    final authViewMode = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 30, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/insta_image.png',
                  scale: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sign Up to see photos and videos    From your friends.',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _usernameController,
                    focusNode: _usernameFocusNode,
                    keyboardType: TextInputType.name,
                    //focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        labelText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.blueColor,
                        )),
                    onFieldSubmitted: (valu){
                      Utils.fieldFocusChange(context, _usernameFocusNode, _emailFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: AppColors.blueColor,
                        )),
                    onFieldSubmitted: (valu){
                      Utils.fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return Container(
                        width: 350,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obsecurePassword.value,
                           focusNode: _passwordFocusNode,

                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock_open_rounded,
                              color: AppColors.blueColor,
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: Icon(_obsecurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: height * .055,
                ),
                Button(
                  title: 'SignUp',
                  onPress: () {
                    if (_usernameController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter username', context);
                    } else if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage('Please enter email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter password', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          'Please enter 6 digit password', context);
                    } else {
                      Map data = {
                        //  "username":'anuj001',
                        // 'email': 'praveen.tiwari@appinventiv.com',
                        // 'password': 'Praveen@123',
                        "username":_usernameController.text.toString(),
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                      };
                      authViewMode.signUpApi(data, context);
                      //  Navigator.push(context,
                      //       MaterialPageRoute(builder: (_) => SignupOtpVerification()));
                      print('api hit');
                    }
                  },
                  //child: Text('Signup'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Have an account? ",
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          color: Color(0xff00258B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
