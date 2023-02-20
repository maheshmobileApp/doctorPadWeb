import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class DoctorAddDetails extends StatelessWidget {
  const DoctorAddDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            OptionWidgets(isAcceptTermsAndConditions: false,onTap: (){},text: 'Add Doctor',),
            SizedBox(height: 20,),
            Container(
              height: 480,
              width: 400,
              decoration: BoxDecoration(
                  color:  AppColors.backgroundcolori, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  SearchTextfield(
                    icon: Icons.home,
                    hintText: 'Name Of The Doctor',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  SearchTextfield(
                    icon: Icons.lock,
                    hintText: 'Doctor Registration Number',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  SearchTextfield(
                    icon: Icons.call,
                    hintText: "Mobile Number",
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  SearchTextfield(
                    icon: Icons.lock,
                    hintText: 'Doctor Speciality',
                  ),
                  Padding(padding: EdgeInsets.all(8)),SearchTextfield(
                    icon: Icons.lock,
                    hintText: 'Clinic Speciality',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  SearchTextfield(
                    icon: Icons.email,
                    hintText: 'Email id',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                AppButton(text:'BULK UPLOAD',color:Color(0xff11193C),
                    myEdgeInsets: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    primaryColor:  Color(0xff1397DB0F),
                    onPressed: () {
                     // context.go(RoutesList.hospitalDetails);
                    }
                ),
                  Padding(padding: EdgeInsets.all(8)),
                  AppButton(text:'ADD DOCTOR',color:AppColors.backgroundcolori,
                      myEdgeInsets: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                      primaryColor:   AppColors.color1,
                      onPressed: () {
                    context.go(RoutesList.addDoctorSuccessfully);
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
