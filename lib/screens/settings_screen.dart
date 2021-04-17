import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/widgets/custom_elevated_button.dart';
import 'package:training_application/shared/widgets/custom_layout.dart';
import 'package:training_application/shared/widgets/custom_text_form_field.dart';

import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Widget _defaultPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0
      ),
      child: child
    );
  }
  
  void _onPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => LoginScreen())
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
            padding: EdgeInsets.only(bottom: 16.0),
            child: Hero(
              tag: 'hero',
              child: Image.asset('assets/images/Cool Kids Bust.png')
            )
          ),
          Form(
            key: _formKey,
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0, left: 16.0),
                  child: Text(
                    'Account information',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      color: ReusableColors.mainTextColor
                    ),
                  )
                ),
                _defaultPadding(
                  CustomTextFormField(
                    hintText: 'Your user name here'
                  )
                ),
                _defaultPadding(
                  CustomElevatedButton(
                    text: 'Edit user name',
                    onPressed: () => _formKey.currentState.validate()
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                    onPressed: () => _onPressed(context),
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: ReusableColors.hintTextColor,
                        fontFamily: 'Rubik',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500
                      )
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
      text: 'Settings'
    );
  }
}
