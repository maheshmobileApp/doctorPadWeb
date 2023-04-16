import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_colors.dart';

class SearchTextfield extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color? color;
  final Image? image;
  final FontStyle? fontStyle;
  final dynamic? SvgPicture;
  final int? maxlength;
  final TextEditingController? controller;
  SearchTextfield({
    Key? key,
    this.icon,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.color,
    this.image,
    this.SvgPicture,
    this.maxlength,
    this.controller,
    this.fontStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:  controller,
        cursorHeight: 20,
        cursorRadius: Radius.zero,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Muli',
            fontSize: 14,
            color: AppColors.color1,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        // prefixIcon: prefixIcon,
          prefixIcon:   Padding(
            padding: EdgeInsets.only(top: 15), // add padding to adjust icon
           child: Icon(
              icon ?? Icons.home,
              color: color ?? Colors.white,

            ),
          ),
        ),
        keyboardType: keyboardType,
        maxLength: maxlength,
        validator: validator);
  }
}
