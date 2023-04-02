import 'package:cgg_base_project/res/components/button_component.dart';
import 'package:cgg_base_project/res/components/sidepanel_widgets/sidepanel_widgets.dart';
import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/constants/routes_constants.dart';

class HospitalWebDetails extends StatelessWidget {
   HospitalWebDetails({Key? key}) : super(key: key);
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            OptionWidgets(
              isAcceptTermsAndConditions: false,
              onTap: () {},
              text: 'Add Hospitals',
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Container(
                  height:  MediaQuery.of(context).size.height/1.2,
                  width:  MediaQuery.of(context).size.width/2.8,
                // height: 480,
                // width: 400,
                padding: EdgeInsets.all(45),
                decoration: BoxDecoration(
                    color: AppColors.backgroundcolori,
                    borderRadius: BorderRadius.circular(16)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchTextfield(
                        icon: Icons.home,
                        hintText: 'Name Of The Hospital',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Name Of The Hospital';
                          }
                        },
                        keyboardType: TextInputType.name,
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      SearchTextfield(
                        icon: Icons.contact_phone_outlined,
                        hintText: 'Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Address';
                          }
                        },
                        keyboardType: TextInputType.text,
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      SearchTextfield(
                          icon: Icons.call,
                          hintText: "Contact Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Contact number';
                            } else if (!phonenovalid(value)) {
                              return 'Enter Valid Mobile number';
                            }
                          },
                          keyboardType: TextInputType.number),
                      Padding(padding: EdgeInsets.all(20)),
                      SearchTextfield(
                        icon: Icons.email,
                        hintText: 'Email id',
                         validator: (value){
                          print(value);
                          if(value!.isEmpty){
                          return "Please Enter Email";
                       }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                      {
                      return "Please Enter a Valid Email";
                    }
                     return null;
                      },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      AppButton(
                          text: 'ADD Doctor To HOSPITAL',
                          color: AppColors.color5,
                          myEdgeInsets:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          borderRadius: BorderRadius.circular(2),
                          primaryColor: Color(0xffB8DAD2),
                          onPressed: () {
                            //  context.go(RoutesList.hospitalDetails);
                          }),
                      Padding(padding: EdgeInsets.all(10)),
                      AppButton(
                          text: 'Back',
                          color: AppColors.backgroundcolori,
                          myEdgeInsets:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          primaryColor: AppColors.color1,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.go(RoutesList.hospitalWebDetails);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
