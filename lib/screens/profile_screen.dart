import 'package:flutter/material.dart';
import 'package:training_application/screens/settings_screen.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/widgets/custom_layout.dart';

class ProfileScreen extends StatelessWidget {
  void _onPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => SettingsScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 52.0),
            child:  GestureDetector(
              onTap: () => _onPressed(context),
              child: Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: ReusableColors.profileBorderColor,
                  foregroundColor: ReusableColors.profileBorderColor,
                  radius: 75.0,
                  child: CircleAvatar(
                    backgroundColor: ReusableColors.profileBgColor,
                    backgroundImage: AssetImage(
                      'assets/images/Cool Kids Bust.png'
                    ),
                    radius: 70.0
                  ),
                )
              ),
            )
          )
        ],
      ),
      text: 'Profile'
    );
  }
}
