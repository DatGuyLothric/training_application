import 'package:flutter/material.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';

class CustomButton extends StatelessWidget {
  final double buttonSize;
  final double iconSize;
  final VoidCallback onButtonTap;
  final IconData icon;

  CustomButton({
    Key key,
    this.buttonSize = 40.0,
    this.iconSize = 12.0,
    this.onButtonTap,
    @required this.icon,
  }) :
    assert(icon != null, 'Icon should not be null'),
    assert(buttonSize != null, 'Button size should not be null'),
    assert(iconSize != null, 'Icon size should not be null'),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: buttonSize, minWidth: buttonSize),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: ReusableColors.inputBorderColor, width: 1.0),
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onButtonTap,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
