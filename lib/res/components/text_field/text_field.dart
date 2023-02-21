import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
class TextFeild extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const TextFeild({Key? key,
    this.icon,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator, required TextStyle hintStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 20,
            child: Icon(
                icon ?? Icons.person
            ),
          ),
          Expanded(
            flex: 5,
            child: TextField(
                cursorHeight:20,
                cursorRadius: Radius.zero,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Muli,Regular',
                        color:AppColors.color1
                    ),
                    prefixIcon: prefixIcon,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:AppColors.color1
                        )
                    )
                ),
                keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
