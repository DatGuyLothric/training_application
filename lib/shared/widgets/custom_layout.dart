import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/enums/screen_enum.dart';

import 'custom_bottom_app_bar.dart';
import 'custom_button.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;
  final String text;
  final EScreen currentScreen;
  final List<Widget> actions;

  CustomLayout({
    this.body,
    this.text = '',
    this.currentScreen,
    this.actions
  }) :
    assert(body != null, 'Body should not be null!'),
    assert(text != null, 'Text should not be null!'),
    assert(currentScreen != null, 'Current screen should not be null!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CustomButton(
              icon: Icons.arrow_back_ios_rounded,
              // @TODO: Where this button should lead us?
              // These screens are independent
              // I don't understand the flow here
              onButtonTap: () {},
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: ReusableColors.mainTextColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5
            )
          ),
          actions: this.actions,
          backgroundColor: Colors.white,
          elevation: 0.0
        ),
        backgroundColor: Colors.white,
        body: body,
        bottomNavigationBar: CustomBottomAppBar(currentScreen: this.currentScreen)
    );
  }
}
