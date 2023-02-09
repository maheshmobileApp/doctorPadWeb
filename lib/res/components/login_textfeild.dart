import 'package:flutter/material.dart';
class LoginTextFeild extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const LoginTextFeild({Key? key,
    this.icon,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 15,
              child: Icon(
               icon ?? Icons.person
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
              cursorHeight:20,
                cursorRadius: Radius.zero,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                  ),
                  prefixIcon: prefixIcon,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff1397DB)
                    )
                  )
                ),
                keyboardType: keyboardType,
                validator: validator
            ),
          ),
        ],
      ),
    );
  }
}
