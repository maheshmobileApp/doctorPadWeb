import '../icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final List<TextInputFormatter>? inputFormatters;
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
    this.inputFormatters,
     
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller:  controller,
          inputFormatters: inputFormatters,
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
                icon ?? MyFlutterApp.call,
                color: color ?? Colors.white,
    
              ),
            ),
          ),
          keyboardType: keyboardType,
          maxLength: maxlength,
          validator: validator),
    );
  }
}
