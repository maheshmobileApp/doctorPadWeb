import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class DoctorDetails extends StatelessWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
       SidepanelWidgets(),
        SingleChildScrollView(
          child: Column(
            children: [
              OptionWidgets(isAcceptTermsAndConditions: false,onTap: (){},text: 'Doctor Details',),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                //height: MediaQuery.of(context).size.height - 100,
                width: 300,
                decoration: BoxDecoration(
                    color:  AppColors.backgroundcolori, borderRadius: BorderRadius.circular(16)),
                // alignment: Alignment.topLeft,
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
                    Padding(padding: EdgeInsets.all(8)),
                    SearchTextfield(
                      icon: Icons.lock,
                      hintText: 'Clinic Speciality',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    SearchTextfield(
                      icon: Icons.email,
                      hintText: 'Email id',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    AppButton(text:'Back', color: AppColors.backgroundcolori,
                        myEdgeInsets: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                        primaryColor:  AppColors.color1,
                        onPressed: () {
                          context.go(RoutesList.doctorWebView);
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
