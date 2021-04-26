import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_application/models/user.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile({ @required this.user }) :
    assert(user != null, 'User should not be null!');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 297.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ReusableColors.tileBgColor,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(color: ReusableColors.inputBorderColor)
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.end,
        direction: Axis.vertical,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 103.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0)
                  ),
                ),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 4.0),
                      child: Text(
                        '3 h 30 min',
                        style: TextStyle(
                          color: ReusableColors.selectedItemColor,
                          fontFamily: 'Rubik',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 4.0),
                      child: Text(
                        this.user.name,
                        style: TextStyle(
                          color: ReusableColors.mainTextColor,
                          fontFamily: 'Rubik',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.5
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'User Color',
                        style: TextStyle(
                          color: ReusableColors.mainTextColor,
                          fontFamily: 'Rubik',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    )
                  ],
                ),
              ),
              Positioned(
                right: 29.0,
                bottom: 65.0,
                width: 75.0,
                height: 75.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    this.user.avatar ?? 'assets/images/profile_example.png'
                  ),
                )
              )
            ],
          )
        ],
      )
    );
  }
}
