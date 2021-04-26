import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_application/shared/consts/reusable_colors.dart';
import 'package:training_application/shared/enums/input_type_enum.dart';
import 'package:training_application/shared/validators/form_field_validator.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final EInputType inputType;
  final Function callback;

  CustomTextFormField({
    this.hintText = '',
    this.inputType = EInputType.DEFAULT,
    this.callback
  }) :
    assert(hintText != null, 'Text property should not be set to null!');

  @override
  _CustomTextFormFieldState createState()
    => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = false;
  bool _valid = true;

  bool get _isIcon => widget.inputType == EInputType.PASSWORD ||
      widget.inputType == EInputType.SEARCH;

  bool get _obscureText =>
    widget.inputType == EInputType.PASSWORD ? _obscure : false;

  Color get _suffixColor => !_obscure && !_valid
    ? ReusableColors.errorColor
    : ReusableColors.mainTextColor;

  Function get _callback {
    if (widget.callback != null) return widget.callback;
    if (widget.inputType == EInputType.PASSWORD) return this._onPressed;
    return null;
  }

  String get _icon {
    if (widget.inputType == EInputType.PASSWORD) {
      return 'assets/images/visibility 1.svg';
    }
    if (widget.inputType == EInputType.SEARCH) {
      return 'assets/images/search.svg';
    }
    return null;
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
        suffixIcon: this._isIcon
          ? IconButton(
            icon: SvgPicture.asset(
              this._icon,
              width: 24.0,
              height: 24.0,
              color: _suffixColor
            ),
            onPressed: this._callback,
          )
          : null,
        hintText: widget.hintText,
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
