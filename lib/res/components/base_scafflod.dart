import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  BaseScaffold({super.key, required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_bg_color,
      body: child,
    );
  }
}
