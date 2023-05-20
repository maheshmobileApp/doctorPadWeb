import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
import '../../res/components/button_component.dart';

class SuccessflullyAlert extends StatelessWidget {
  SuccessflullyAlert({Key? key, this.onPressed, this.title}) : super(key: key);
  void Function()? onPressed;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/successfully.png'),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              title ?? "",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Muli', color: Color(0xff1397DB)),
            ),
            Padding(padding: EdgeInsets.all(10)),
            AppButton(
                text: 'Back',
                color: Color(0xffFFFFFF),
                myEdgeInsets:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                primaryColor: AppColors.color10,
                onPressed: onPressed),
          ],
        ),
      ],
    ));
  }
}
