import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';

class AddHospitalSuccessfully extends StatelessWidget {
  const AddHospitalSuccessfully({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            HeadderWidget(
              onTap: () {},
              text: 'Add Hospitals',
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/successfully.png'),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Added Hospital Successfully',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Muli',
                        color: Color(0xff1397DB)),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  AppButton(
                      text: 'Back',
                      color: Color(0xffFFFFFF),
                      myEdgeInsets:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      primaryColor: AppColors.color10,
                      onPressed: () {
                        context.go(RoutesList.hospitalView);
                      }),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
