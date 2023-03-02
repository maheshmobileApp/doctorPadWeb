import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double? height;
  const LogoWidget({Key? key,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/doctpad.png',
        height:height ?? 100,
        width: 100,
      ),
    );
  }
}
