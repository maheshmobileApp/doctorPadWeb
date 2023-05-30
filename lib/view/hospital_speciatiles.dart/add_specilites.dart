import 'package:cgg_base_project/view_model/hospital_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/icon.dart';
import '../../res/components/inputTextField.dart';
import '../../view_model/doctor_view_model.dart';

class AddSpecilities extends StatelessWidget {
  AddSpecilities({super.key});
  TextEditingController _specialityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    return Container(
        child: Form(
      key: _formKey,
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
              //  prefixIcon: Icon(MyFlutterApp.doctor),
              title: 'Speciality',
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
            height: 30,
          ),
          AppButton(
              text: 'ADD Speciality',
              color: AppColors.backgroundcolori,
              primaryColor: AppColors.color1,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  viewModel.addSpecility(_specialityController.text, context);
                }
              }),
        ],
      ),
    ));
  }
}
