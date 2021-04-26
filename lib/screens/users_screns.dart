import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_application/screens/user_info_screen.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/enums/input_type_enum.dart';
import 'package:training_application/shared/enums/screen_enum.dart';
import 'package:training_application/shared/mocks/users_service_mock.dart';
import 'package:training_application/shared/widgets/custom_bottom_app_bar.dart';
import 'package:training_application/shared/widgets/custom_text_form_field.dart';
import 'package:training_application/widget/user_tile.dart';

class UsersScreen extends StatelessWidget {
  void _onTap(int id, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserInfoScreen(userId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 4.0, left: 16.0),
              child: Text(
                'Hello,',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16.0,
                  letterSpacing: -0.5,
                  color: ReusableColors.mainTextColor
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.0, left: 16.0),
              child: Text(
                'Thomas Anderson',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  letterSpacing: -1.0,
                  color: ReusableColors.secondaryTextColor
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child:CustomTextFormField(
                hintText: 'Search people',
                inputType: EInputType.SEARCH
              )
            ),
            Expanded(
              child: FutureBuilder(
                future: UserService.getUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) return Container();
                  final List<Widget> children = [];
                  snapshot.data.forEach((user) => children.add(
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.0,
                        left: 16.0,
                        right: 16.0
                      ),
                      child: GestureDetector(
                        onTap: () => this._onTap(user.id, context),
                        child: UserTile(user: user)
                      )
                    )
                  ));
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: children,
                  );
                }
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(currentScreen: EScreen.USERS)
    );
  }
}
