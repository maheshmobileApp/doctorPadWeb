import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';

class DoctorDetails extends StatelessWidget {
  DoctorDetails({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        SingleChildScrollView(
          child: Column(
            children: [
              OptionWidgets(
                isAcceptTermsAndConditions: false,
                onTap: () {},
                text: 'Doctor Details',
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Container(
                    height:  MediaQuery.of(context).size.height/1.2,
                  width:  MediaQuery.of(context).size.width/3,
                 // height: 500,
                  //height: MediaQuery.of(context).size.height - 100,
                 // width: 300,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                     // color: AppColors.backgroundcolor,
                     //color: AppColors.backgroundcolor,
                        gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.centerLeft,
                  colors: [
                  AppColors.color10,
                  AppColors.backgroundcolor
                ]),
                      borderRadius: BorderRadius.circular(16)),
                  // alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchTextfield(
                          icon: Icons.person,
                          hintText: 'Name Of The Doctor',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name Of The Doctor';
                            }
                          },
                          keyboardType: TextInputType.name,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                         SizedBox(height: MediaQuery.of(context).size.height/ 30,),
                        SearchTextfield(
                          icon: Icons.contact_phone_outlined,
                          hintText: 'Doctor Registration Number',
                           validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Doctor Registration Number ';
                          } else if (!phonenovalid(value)) {
                            return 'Enter Valid Doctor Registration Number';
                          }
                        },
                          keyboardType: TextInputType.number,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                         SizedBox(height: MediaQuery.of(context).size.height/ 30,),
                        SearchTextfield(
                          icon: Icons.call,
                          hintText: "Mobile Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Mobile number';
                            } else if (!phonenovalid(value)) {
                              return 'Enter Valid Mobile number';
                            }
                          },
                          keyboardType: TextInputType.number
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                         SizedBox(height: MediaQuery.of(context).size.height/ 30,),
                        SearchTextfield(
                          icon: Icons.person,
                          hintText: 'Doctor Speciality',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Doctor Speciality';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                         SizedBox(height: MediaQuery.of(context).size.height/ 30,),
                        SearchTextfield(
                          icon: Icons.home,
                          hintText: 'Clinic Speciality',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Clinic Speciality';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                         SizedBox(height: MediaQuery.of(context).size.height/ 30,),
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
                        // Padding(padding: EdgeInsets.all(8)),
                         SizedBox(height: MediaQuery.of(context).size.height/ 30,),
                        AppButton(
                            text: 'Back',
                            color: AppColors.backgroundcolori,
                            myEdgeInsets: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            primaryColor: AppColors.color1,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.go(RoutesList.doctorWebView);
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
