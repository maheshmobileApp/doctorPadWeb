import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/icon.dart';
import '../../res/components/inputTextField.dart';

class AddSpecilities extends StatelessWidget {
  AddSpecilities({super.key});
  TextEditingController _specialityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
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
        AppInputTextField(
            prefixIcon: Icon(MyFlutterApp.doctor),
            controller: _specialityController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Speciality';
              }
              return null;
            },
            hintText: "Enter Speciality"),
        SizedBox(
          height: 20,
        ),
        AppButton(
            text: 'ADD Speciality',
            color: AppColors.backgroundcolori,

            // myEdgeInsets:
            //     EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            primaryColor: AppColors.color1,
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   viewModel.addDoctor(context,
              //       createdBy: "test",
              //       emailId: _emailIdController.text,
              //       mobileNo: _mobileNumberController.text,
              //       name: _nameOfTheDoctorController.text,
              //       doctorRegistrationNumber:
              //           _doctorRegistrationNumberController.text);
              //   //  context.go(RoutesList.addDoctorSuccessfully);
              // }
            }),
      ],
    ));
  }
}
