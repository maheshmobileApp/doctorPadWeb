import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SmallButton extends StatelessWidget {
  SmallButton({super.key, required this.title, required this.onPressed});
  final String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.backgroundcolor, //<-- SEE HERE
        ),
        onPressed: onPressed,
        child: Container(
          // color: AppColors.app_bg_color,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
