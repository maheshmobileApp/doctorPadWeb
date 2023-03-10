import 'package:cgg_base_project/res/constants/routes_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
class AddDoctorSuccessfully extends StatelessWidget {
  const AddDoctorSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            OptionWidgets(isAcceptTermsAndConditions: false,onTap: (){},text: 'Add Doctor',),
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
                  Image.asset('assets/successfully.png'),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Added Doctor Successfully',
                    style: TextStyle(fontSize: 20,fontFamily: 'Muli', color:  AppColors.backgroundcolori,),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  AppButton(text:'Back',color:  AppColors.color1,
                      myEdgeInsets: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                      primaryColor:  AppColors.backgroundcolori,
                      onPressed: () {
                        context.go(RoutesList.doctorWebView);
                      }
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
