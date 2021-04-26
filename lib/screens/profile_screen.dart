import 'package:flutter/material.dart';
import 'package:training_application/screens/settings_screen.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/enums/screen_enum.dart';
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
      currentScreen: EScreen.PROFILE,
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 52.0, bottom: 32.0),
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
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  letterSpacing: -0.5,
                  color: ReusableColors.mainTextColor,
                ),
                primary: Colors.white,
                onPrimary: ReusableColors.mainTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                side: BorderSide(
                  width: 1.0,
                  color: ReusableColors.inputBorderColor
                ),
                minimumSize: Size(double.infinity, 80.0),
                elevation: 0.0
              ),
              child: Text('Show onboarding')
            )
          )
        ],
      ),
      text: 'Profile'
    );
  }
}
