import 'package:cgg_base_project/res/components/text_field/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebTextfield extends StatelessWidget {
  const WebTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/icons/doctor.png'),
            TextFeild(
              hintText: 'Name Of The Hospital',
            hintStyle: TextStyle(
              fontFamily: 'Muli,Regular'
            )
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
