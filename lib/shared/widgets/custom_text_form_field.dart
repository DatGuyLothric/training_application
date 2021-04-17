import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/validators/form_field_validator.dart';

class CustomTextFormField extends StatefulWidget {
  final String _hintText;
  final bool _suffixIcon;

  CustomTextFormField({ hintText = '', suffixIcon = false }) :
    this._hintText = hintText,
    this._suffixIcon = suffixIcon,
    assert(hintText != null, 'Text property should not be set to null!'),
    assert(suffixIcon != null, 'Bool property should not be set to null!');

  @override
  _CustomTextFormFieldState createState()
    => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = false;
  bool _valid = true;

  bool get _obscureText {
    return widget._suffixIcon ? _obscure : false;
  }

  Color get _suffixColor {
    return !_obscure && !_valid
      ? ReusableColors.errorColor
      : ReusableColors.mainTextColor;
  }

  void _onPressed() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _invalidCallback(bool value) {
    setState(() {
      _valid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String value) => formFieldValidator(value, _invalidCallback),
      obscureText: _obscureText,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: ReusableColors.errorColor
        ),
        suffixIcon: widget._suffixIcon
          ? IconButton(
            icon: SvgPicture.asset(
              'assets/images/visibility 1.svg',
              width: 24.0,
              height: 24.0,
              color: _suffixColor
            ),
            onPressed: _onPressed,
          )
          : null,
        hintText: widget._hintText,
        hintStyle: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: ReusableColors.hintTextColor
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ReusableColors.inputBorderColor
          ),
          borderRadius: BorderRadius.circular(12.0)
        ),
      ),
    );
  }
}
