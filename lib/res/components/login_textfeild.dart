import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_colors.dart';

class LoginTextFeild extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
   final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  LoginTextFeild({
    Key? key,
    this.icon,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 85),
      child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.color12,
                child: Icon(icon ?? Icons.person, color: AppColors.color1),
              ),
            ],
          ),
          SizedBox(
            width: 9,
          ),
          Expanded(
            flex: 4,
            child: TextFormField(
                cursorHeight: 20,
                cursorRadius: Radius.zero,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: inputFormatters,
                maxLength: maxLength,
                decoration: InputDecoration(
                  counterText: '',
                    contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 2),
                    hintText: hintText,
                    hintStyle: TextStyle(
                        fontFamily: 'Muli', fontSize: 14, color: Colors.grey),
                    prefixIcon: prefixIcon,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.backgroundcolori))),
                keyboardType: keyboardType,
                validator: validator),
          ),
        ],
      ),
    );
  }
}
