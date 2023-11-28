import 'package:demo_projectapp/Constants.dart';
import 'package:flutter/material.dart';


class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  double width = MediaQuery.of(context).size.width;

    return Container(
      height: 45.0,
      width: 140.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(27.0),
        ),
        onPressed: () {
          //? do something
        },
        color: Color(0xff01dc9d),
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Text(
            "GET STARTED",
            style: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        )),
      ),
    );
  }
  
  FlatButton({required RoundedRectangleBorder shape, required Null Function() onPressed, required Color color, required Center child}) {}
}