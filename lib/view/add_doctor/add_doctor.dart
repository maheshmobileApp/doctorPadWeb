import 'package:cgg_base_project/res/components/inputTextField.dart';
import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/icon.dart';
import '../../res/components/search_textfield/search_textfield.dart';

import '../../view_model/doctor_view_model.dart';

class AddDoctorForm extends StatelessWidget {
  AddDoctorForm({Key? key}) : super(key: key);

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
      body: Form(
        key: _formKey,
        child: Container(
          //  padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              //color: AppColors.backgroundcolor,
              //  borderRadius: BorderRadius.circular(16)
              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                        height: 35, width: 75, child: Icon(Icons.close)),
                  ),
                ),
                AppInputTextField(
                    prefixIcon: Icon(MyFlutterApp.doctor),
                    controller: _nameOfTheDoctorController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name Of The Doctor';
                      }
                      return null;
                    },
                    hintText: "Name Of The Doctor"),
                AppInputTextField(
                  controller: _doctorRegistrationNumberController,
                  prefixIcon: Icon(MyFlutterApp.contact),
                  hintText: 'Doctor Registration Number',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Doctor Registration Number';
                    } else if (!phonenovalid(value)) {
                      return 'Enter Valid Doctor Registration Number';
                    }
                  },
                  keyboardType: TextInputType.number,
                ),

                AppInputTextField(
                  controller: _mobileNumberController,
                  prefixIcon: Icon(MyFlutterApp.call),
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

                AppInputTextField(
                  controller: _doctorSpecialityController,
                  prefixIcon: Icon(MyFlutterApp.doctor),
                  hintText: 'Doctor Speciality',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Doctor Speciality';
                    }
                  },
                  keyboardType: TextInputType.text,
                ),

                AppInputTextField(
                  controller: _clinicSpecialityController,
                  prefixIcon: Icon(MyFlutterApp.home),
                  hintText: 'Clinic Speciality',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Clinic Speciality';
                    }
                  },
                  keyboardType: TextInputType.text,
                ),
                // Padding(padding: EdgeInsets.all(8)),

                AppInputTextField(
                  controller: _emailIdController,
                  prefixIcon: Icon(MyFlutterApp.message),
                  hintText: 'Email id',
                  validator: (value) {
                    print(value);
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                // Padding(padding: EdgeInsets.all(8)),

                // AppButton(
                //     text: 'BULK UPLOAD',
                //     color: Color(0xff11193C),
                //     myEdgeInsets:
                //         EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                //     primaryColor: Color(0xff1397DB0F),
                //     onPressed: () {
                //       // context.go(RoutesList.hospitalDetails);
                //     }),
                // Padding(padding: EdgeInsets.all(8)),

                AppButton(
                    text: 'ADD DOCTOR',
                    color: AppColors.backgroundcolori,

                    // myEdgeInsets:
                    //     EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    primaryColor: AppColors.color1,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.addDoctor(context,
                            createdBy: "test",
                            emailId: _emailIdController.text,
                            mobileNo: _mobileNumberController.text,
                            name: _nameOfTheDoctorController.text,
                            doctorRegistrationNumber:
                                _doctorRegistrationNumberController.text);
                        //  context.go(RoutesList.addDoctorSuccessfully);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
