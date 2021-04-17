import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';

import 'custom_bottom_app_bar.dart';

class CustomLayout extends StatelessWidget {
  final Widget _body;
  final String _text;

  CustomLayout({ Widget body, String text = '' }) :
    this._body = body,
    this._text = text,
    assert(body != null, 'Body should not be null!'),
    assert(text != null, 'Text should not be null!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _text,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: ReusableColors.mainTextColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5
            )
          ),
          backgroundColor: Colors.white,
          elevation: 0.0
        ),
        backgroundColor: Colors.white,
        body: _body,
        bottomNavigationBar: CustomBottomAppBar()
    );
  }
}
