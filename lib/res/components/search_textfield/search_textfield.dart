import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  const SearchTextfield({Key? key,
    this.icon,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.color,
    this.image,
    this.fontStyle
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorHeight:20,
        cursorRadius: Radius.zero,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Muli,Regular',
            fontSize: 14,
            color: AppColors.color1,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 15), // add padding to adjust icon
            child: Icon(icon??Icons.help_outline,color:color?? Colors.white,),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator
    );
  }
}
