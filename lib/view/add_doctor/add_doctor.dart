import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';

import '../../view_model/doctor_view_model.dart';

class DoctorAddDetails extends StatelessWidget {
  DoctorAddDetails({Key? key}) : super(key: key);

  TextEditingController _nameOfTheDoctorController = TextEditingController();

  TextEditingController _doctorRegistrationNumberController =
      TextEditingController();

  TextEditingController _mobileNumberController = TextEditingController();

  TextEditingController _doctorSpecialityController = TextEditingController();

  TextEditingController _clinicSpecialityController = TextEditingController();

  TextEditingController _emailIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllDoctorViewModel>();
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            OptionWidgets(
              isAcceptTermsAndConditions: false,
              onTap: () {},
              text: 'Add Doctor',
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width / 3,
                  // height: 520,
                  // width: 400,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundcolor,
                      borderRadius: BorderRadius.circular(16)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchTextfield(
                          controller: _nameOfTheDoctorController,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        SearchTextfield(
                          controller: _doctorRegistrationNumberController,
                         icon: Icons.contact_phone_outlined,

                          hintText: 'Doctor Registration Number',
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter Doctor Registration Number';
                          //   } else if (!phonenovalid(value)) {
                          //     return 'Enter Valid Doctor Registration Number';
                          //   }
                          // },
                          keyboardType: TextInputType.number,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        SearchTextfield(
                          controller: _mobileNumberController,
                         icon: Icons.call,

                          hintText: "Mobile Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Mobile number';
                            } else if (!phonenovalid(value)) {
                              return 'Enter Valid Mobile number';
                            }
                          },
                          keyboardType: TextInputType.number,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.all(8),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        SearchTextfield(
                          controller: _doctorSpecialityController,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        SearchTextfield(
                          controller: _clinicSpecialityController,
                          icon: Icons.local_hospital,

                          hintText: 'Clinic Speciality',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Clinic Speciality';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        SearchTextfield(
                          controller: _emailIdController,
                          icon: Icons.email,
                         // prefixIcon: SvgPicture.asset('assets/icons/message.svg',
                            // height:  MediaQuery.of(context).size.height / 250,
                          //   // width: 1,fit: BoxFit.contain,
                          //   height: 20.0,
                          //   width: 20.0,
                          //   allowDrawingOutsideViewBox: true,
                          // ),
                          hintText: 'Email id',
                          validator: (value) {
                            print(value);
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            } else if (!RegExp(r'\S+@\S+\.\S+')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Email";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        AppButton(
                            text: 'BULK UPLOAD',
                            color: Color(0xff11193C),
                            myEdgeInsets: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            primaryColor: Color(0xff1397DB0F),
                            onPressed: () {
                              // context.go(RoutesList.hospitalDetails);
                            }),
                        // Padding(padding: EdgeInsets.all(8)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        AppButton(
                            text: 'ADD DOCTOR',
                            color: AppColors.backgroundcolori,
                            myEdgeInsets: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            primaryColor: AppColors.color1,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                viewModel.addDoctor(context,
                                    createdBy: "test",
                                    emailId: _emailIdController.text,
                                    mobileNo: _mobileNumberController.text,
                                    name: _nameOfTheDoctorController.text,
                                    doctorRegistrationNumber:
                                        _doctorRegistrationNumberController
                                            .text);
                                //  context.go(RoutesList.addDoctorSuccessfully);
                              }
                            }),
                      ],
                    ),
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
