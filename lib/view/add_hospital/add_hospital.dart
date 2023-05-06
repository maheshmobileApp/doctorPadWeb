import 'package:cgg_base_project/res/components/inputTextField.dart';
import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/icon.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';

import '../../res/constants/routes_constants.dart';
import '../../view_model/hospital_viewmodel.dart';

class AddHospitalsForms extends StatelessWidget {
  AddHospitalsForms({Key? key}) : super(key: key);
  TextEditingController _nameOfTheHospitalController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  TextEditingController _contactNumberController = TextEditingController();

  TextEditingController _emailIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(height: 35, width: 75, child: Icon(Icons.close)),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppInputTextField(
                      controller: _nameOfTheHospitalController,
                      prefixIcon: Icon(MyFlutterApp.home),
                      hintText: 'Name Of The Hospital',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name Of The Hospital';
                        }
                      },
                      keyboardType: TextInputType.name,
                    ),
                    AppInputTextField(
                      controller: _addressController,
                      prefixIcon: Icon(MyFlutterApp.contact),
                      hintText: 'Address',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name Of The Address';
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                    AppInputTextField(
                      controller: _contactNumberController,
                      prefixIcon: Icon(MyFlutterApp.call),
                      hintText: "Contact number",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Contact number';
                        } else if (!phonenovalid(value)) {
                          return 'Enter Valid Mobile number';
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
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
                    AppButton(
                        text: 'ADD  HOSPITAL',
                        color: AppColors.backgroundcolori,
                        myEdgeInsets:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        primaryColor: AppColors.color1,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.addHospital(
                              context,
                              createdBy: "text",
                              email: _emailIdController.text,
                              name: _nameOfTheHospitalController.text,
                              phone: _contactNumberController.text,
                            );
                            // context.go(RoutesList.addHospitalSuccessfully);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
