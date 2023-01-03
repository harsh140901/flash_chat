import 'package:flash_chat/logiin_screen.dart';
import 'package:flash_chat/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const textstyle =  TextStyle(
  fontSize: 20.0,
  color: Colors.white,
);
class Buttons extends StatelessWidget {

  Buttons({required this.colour,required this.Buttonlabel ,required this.onPressed});
  final Color colour;
  final String Buttonlabel;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            Buttonlabel,
            style: textstyle,
          ),
        ),
      ),
    );
  }
}
