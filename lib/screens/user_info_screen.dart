import 'package:flutter/material.dart';
import 'package:training_application/screens/users_screns.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/mocks/users_service_mock.dart';
import 'package:training_application/shared/widgets/custom_button.dart';
import 'package:training_application/shared/widgets/custom_elevated_button.dart';

class UserInfoScreen extends StatelessWidget {
  final int userId;

  UserInfoScreen({ @required this.userId }) :
    assert(userId != null, 'User should not be null!');

  void _onButtonTap(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _mainText(String text) {
    assert(text != null, 'Text should not be null!');
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
        letterSpacing: -0.5,
        color: ReusableColors.mainTextColor
      ),
    );
  }

  Widget _secondaryText(String text) {
    assert(text != null, 'Text should not be null!');
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: ReusableColors.mainTextColor
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.getUser(this.userId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        );
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: CustomButton(
                icon: Icons.arrow_back_ios_rounded,
                onButtonTap: () => this._onButtonTap(context),
              ),
            ),
            title: Text(
              snapshot.data.name,
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
          body: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: Image.asset('assets/images/Illustration.png')
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
                child: this._mainText('About some thing')
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
                child: this._secondaryText('Lorem ipsum dolor sit amet, consectetur a'
                'dipiscing elit. Sed non purus faucibus tortor auctor pretium. S'
                'ed quis volutpat nisl, vel cursus dui. Vestibulum vitae lectus '
                'mi. Donec nec sapien varius, sollicitudin leo ac, vulputate nis'
                'l. Donec ut interdum eros, eget eleifend turpis. Aliquam sit am'
                'et purus ut metus tempor aliquet at nec leo. ')
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
                child: this._mainText('Duration')
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 51.0),
                child: this._secondaryText('1 h 30 min')
              ),
              Padding(
                padding: EdgeInsets.only(left: 33.0, right: 33.0),
                child: CustomElevatedButton(
                  text: 'Add to cart',
                  onPressed: () {},
                )
              ),
            ],
          ),
        );;
      }
    );
  }
}
