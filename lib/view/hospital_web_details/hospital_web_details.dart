import 'package:cgg_base_project/res/components/button_component.dart';
import 'package:cgg_base_project/res/components/sidepanel_widgets/sidepanel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class HospitalWebDetails extends StatelessWidget {
  const HospitalWebDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            OptionWidgets(isAcceptTermsAndConditions: false,onTap: (){},text: 'Add Hospitals',),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 480,
              width: 400,
              decoration: BoxDecoration(
                  color:  AppColors.backgroundcolori, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  TextFeild(
                    icon:Icons.person,
                    hintText: 'Name Of The Hospital',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.contact_phone_outlined,
                    hintText: 'Address',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.call,
                    hintText: "Contact Number",
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.email,
                    hintText: 'Email id',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  AppButton(text:'ADD Doctor To HOSPITAL',color:  AppColors.color5,
                      myEdgeInsets: EdgeInsets.symmetric(horizontal:20,vertical:10),
                      borderRadius: BorderRadius.circular(2),
                      primaryColor: Color(0xffB8DAD2),
                      onPressed: () {
                  //  context.go(RoutesList.hospitalDetails);
                  }
                  ),
                  Padding(padding:EdgeInsets.all(10)),
                  AppButton(text:'Back',color:AppColors.backgroundcolori,
                      myEdgeInsets: EdgeInsets.symmetric(horizontal:40,vertical:10),
                      primaryColor:   AppColors.color1,
                      onPressed: () {
                        context.go(RoutesList.hospitalWebDetails);
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
