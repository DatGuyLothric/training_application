import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_application/screens/profile_screen.dart';
import 'package:training_application/screens/settings_screen.dart';
import 'package:training_application/screens/users_screns.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/enums/screen_enum.dart';

class CustomBottomAppBar extends StatefulWidget {
  final EScreen currentScreen;

  CustomBottomAppBar({ @required this.currentScreen }) :
    assert(currentScreen != null, 'Current screen should not be null!');

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  BottomNavigationBarItem _defaultNavigationItem(
    IconData icon,
    String text
  ) {
    assert(icon != null, 'Icon should not be null!');
    assert(text != null, 'Text should not be null!');
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: ReusableColors.inputBorderColor
      ),
      activeIcon: Icon(
        icon,
        color: ReusableColors.inputBorderColor
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 14.0,
          fontWeight: FontWeight.w400
        ),
      )
    );
  }

  void _onTap(int index, BuildContext context) {
    if (index != widget.currentScreen.index) {
      final getScreen = <Widget>(int index) {
        switch(index) {
          case 0:
            return UsersScreen();
          case 1:
            return ProfileScreen();
          case 2:
            return SettingsScreen();
          default:
            return ProfileScreen();
        }
      };

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context)
          => getScreen(index))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ReusableColors.inputBorderColor
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        ),
        child: BottomNavigationBar(
          currentIndex: widget.currentScreen.index,
          elevation: 0.0,
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(
            color: ReusableColors.selectedItemColor
          ),
          onTap: (int index) => this._onTap(index, context),
          items: [
            _defaultNavigationItem(
              Icons.article_outlined,
              'Users'
            ),
            _defaultNavigationItem(
              Icons.account_circle_outlined,
              'Profile'
            ),
            _defaultNavigationItem(
              Icons.settings,
              'Settings'
            )
          ]
        ),
      )
    );
  }
}
