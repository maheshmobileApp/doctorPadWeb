import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
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
              padding: EdgeInsets.all( 45),
              decoration: BoxDecoration(
                  color:  AppColors.backgroundcolori, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  SearchTextfield(
                    icon: Icons.home,
                   // image: Image.asset('assets/icons/home.png'),
                    hintText:  'Name Of The Hospital',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  SearchTextfield(
                    icon: Icons.contact_phone_outlined,
                    hintText: 'Address',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  SearchTextfield(
                    icon: Icons.call,
                    hintText: "Contact Number",
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  SearchTextfield(
                    icon: Icons.email,
                    hintText:  'Email id',
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  AppButton(text:'ADD  HOSPITAL', color:   AppColors.backgroundcolori,
                      myEdgeInsets: EdgeInsets.symmetric(horizontal:40,vertical:5),
                      primaryColor:   AppColors.color1,
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
