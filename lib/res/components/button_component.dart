import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.text, required this.onPressed,this.color,this.width});
  final String text;
  final Color? color;
  final double? width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
         onPressed:onPressed,style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ), primary:color ?? Color(0xff1397DB)),
      child:Text(text,style:TextStyle(fontSize: 12) ,)
    );
  }
}
