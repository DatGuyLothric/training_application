import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  CustomElevatedButton({ this.onPressed, this.text = '' }) :
    assert(text != null, 'Text should not be null!');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Colors.white,
        ),
        primary: ReusableColors.buttonBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minimumSize: Size(double.infinity, 56.0),
        elevation: 0.0
      ),
      onPressed: onPressed,
      child: Text(text)
    );
  }
}
