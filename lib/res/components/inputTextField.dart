import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppInputTextField extends StatelessWidget {
  AppInputTextField(
      {super.key,
      required this.prefixIcon,
      required this.controller,
      required this.hintText,
      this.textColor = Colors.grey,
      this.isSecured,
      this.onTap,
      this.isVisible,
      this.validator,
      this.keyboardType});
  final Widget prefixIcon;
  final TextEditingController controller;
  final String hintText;
  final Color? textColor;
  final bool? isSecured;
  final bool? isVisible;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: this.isVisible ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: this.isSecured == true
              ? GestureDetector(
                  onTap: () {
                    this.onTap!();
                  },
                  child: Icon(this.isVisible == true
                      ? Icons.remove_red_eye_outlined
                      : Icons.read_more_outlined),
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            fontFamily: "poppins",
            color: textColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}
