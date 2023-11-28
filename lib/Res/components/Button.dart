import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:flutter/material.dart';




class Button extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;
  const Button({Key? key ,
    required this.title,
    this.loading = false ,
     required this.onPress, 

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
            child:loading ? CircularProgressIndicator(color: Colors.white,) :  Text(title ,
              style: TextStyle(color: AppColors.whiteColor,fontSize: 20,fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}