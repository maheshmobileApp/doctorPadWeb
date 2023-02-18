import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/Web_Textfield/Web_Textfield.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class HospitalDetails extends StatelessWidget {
  const HospitalDetails({Key? key}) : super(key: key);
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
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                  color:Color.fromRGBO(15, 148, 220, 1), borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  TextFeild(
                    icon: Icons.person,
                    hintText: 'Name Of The Hospital',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFeild(
                    icon: Icons.lock,
                    hintText: 'Address',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFeild(
                    icon: Icons.call,
                    hintText: "Contact Number",
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFeild(
                    icon: Icons.email,
                    hintText: 'Email id',
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  AppButton(text:'ADD  HOSPITAL', color: Colors.blue,
                      myEdgeInsets: EdgeInsets.symmetric(horizontal:40,vertical:5),
                      primaryColor: Colors.white,
                      onPressed: () {
                    context.go(RoutesList.addHospitalSuccessfully);
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
