import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.text,
        required this.onPressed,
        this.color,this.width, this.myEdgeInsets,this. borderRadius ,this.primaryColor});
  final String text;
  final Color? color;
  final double? width;
  final void Function()? onPressed;
  final EdgeInsets? myEdgeInsets;
  final  BorderRadius?  borderRadius;
  final dynamic? primaryColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
         onPressed:onPressed,style: ElevatedButton.styleFrom(
      padding: myEdgeInsets ?? EdgeInsets.symmetric(horizontal: 100,vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius:borderRadius?? BorderRadius.circular(50),
        ), primary:primaryColor?? AppColors.backgroundcolori),
      child:Text(text,style:TextStyle( fontSize: 12 ,fontFamily:'Muli',color:color?? AppColors.color1) ,)
    );
  }
}
