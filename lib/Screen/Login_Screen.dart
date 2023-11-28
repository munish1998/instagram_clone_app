import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:demo_projectapp/Res/components/Button.dart';
import 'package:demo_projectapp/Screen/Forget_Password_Screen.dart';
import 'package:demo_projectapp/Screen/Signup_Screen.dart';
import 'package:demo_projectapp/Utils/Utils.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:demo_projectapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode=FocusNode();
  final FocusNode _passwordFocusNode=FocusNode();
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  final _formKey=GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
     
    
  
 final authViewMode = Provider.of<AuthViewModel>(context);
  
    final height = MediaQuery.of(context).size.height * 1;

    mq = MediaQuery.of(context).size;
    //var value;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 90,left: 30,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/insta_image.png',scale: 20,),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    //keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: AppColors.blueColor,
                        )),
                    onFieldSubmitted: (valu){
                      Utils.fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                    valueListenable: obsecurePassword,
                    builder: (context, value, child) {
                      return SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: obsecurePassword.value,
                           focusNode: _passwordFocusNode,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: const Icon(
                              Icons.lock_open_rounded,
                              color: AppColors.blueColor,
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  obsecurePassword.value =
                                      !obsecurePassword.value;
                                },
                                child: Icon(obsecurePassword.value
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
                  title: 'Login',
                  onPress: () {
                   
                     if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage('Please enter email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter password', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          'Please enter 6 digit password', context);
                    } else {
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                      };
                      authViewMode.loginApi(data, context);
                      print('api hit');
                    }
                  },
                  //child: Text('Signup'),
                ),
                const SizedBox(
                  height: 20,
                ),
               GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const ForgetPassword()));
                },
                child: const Text('Forget Password?',style: TextStyle(
                        fontSize: 20,color: Colors.black26,
                        fontWeight: FontWeight.bold
                      ),),
               ),
               const SizedBox(
                height: 20,
               ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 1,
                    width: 142,
                    color: Colors.black,
                  ),
                  //SizedBox(width: 10,),
                  const Text('OR'),
                 // SizedBox(width: 10,),
                  Container(
                    height: 1,
                    width:142,
                    color: Colors.black,
                  ),
                ],
               ),
                const SizedBox(
                  height: 20,
                ),
             
               Row( 
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [ 
                            const Text("Don't have an account? ", 
                            style: TextStyle( 
                            fontSize: 20
                            ), 
                            ), 
                            GestureDetector( 
                              onTap: (){ 
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
                              }, 
                              child: const Text('Sign Up', 
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
            )
          ),
        ),
      ),
    );
  }
}