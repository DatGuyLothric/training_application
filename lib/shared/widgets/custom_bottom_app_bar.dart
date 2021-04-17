import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
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
          elevation: 0.0,
          backgroundColor: Colors.white,
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
