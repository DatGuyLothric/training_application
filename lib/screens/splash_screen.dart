import 'dart:async';

import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen())
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Image.asset('assets/images/Cool Kids On Wheels.png')
            ),
            Text(
              'SköL@\nFlutter Dev',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 40.0,
                color: ReusableColors.mainTextColor,
                letterSpacing: -1,
                fontWeight: FontWeight.w700
              ),
            )
          ]
        )
      )
    );
  }
}
