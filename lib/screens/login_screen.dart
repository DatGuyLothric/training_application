import 'package:flutter/material.dart';
import 'package:training_application/screens/profile_screen.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/enums/input_type_enum.dart';
import 'package:training_application/shared/widgets/custom_elevated_button.dart';
import 'package:training_application/shared/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
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
    if (_formKey.currentState.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context)
          => ProfileScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Image.asset('assets/images/Cool Kids Sitting.png')
          ),
          Form(
            key: _formKey,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      color: ReusableColors.mainTextColor
                    ),
                  )
                ),
                _defaultPadding(CustomTextFormField(hintText: 'Email')),
                _defaultPadding(
                  CustomTextFormField(
                    hintText: 'Password',
                    inputType: EInputType.PASSWORD
                  )
                ),
                _defaultPadding(
                  CustomElevatedButton(
                    text: 'Log in',
                    onPressed: () => _onPressed(context),
                  ),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}
