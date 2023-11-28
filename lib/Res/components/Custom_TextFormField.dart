import 'package:demo_projectapp/Res/components/App_Colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final val;
  final IconData icons;
  final TextEditingController control;
  const CustomTextField({super.key,required this.label,this.val,required this.icons,required this.control });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  
  // TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
      ),
      child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.control,
             // keyboardType:TextInputType.emailAddress,
              focusNode: FocusNode(),
              decoration: InputDecoration(
                  labelText: widget.label,
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(
                    widget.icons,
                    color: AppColors.pinkColor,
                  )),
              validator: widget.val,
            ),
    );

    
  }
}