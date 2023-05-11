import 'package:cgg_base_project/res/components/inputTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:provider/provider.dart';

import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../view_model/hospital_viewmodel.dart';
import 'image_sclection_screen.dart';

class AddBranchData extends StatelessWidget {
  AddBranchData({super.key});
  TextEditingController _branchNameControl = TextEditingController();
  TextEditingController _branchAddressControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  controller: _branchNameControl,
                  hintText: "Enter Branch Name",
                  title: "Branch Name",
                ),
                _sizedBox(height: 10),
                AppInputTextField(
                  controller: _branchAddressControl,
                  hintText: "Enter Branch Address",
                  title: "Branch Address",
                ),
                _sizedBox(height: 10),
                Text("Select The Specialities",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                _sizedBox(height: 10),
                selectSpecilization(viewModel),
                _sizedBox(height: 10),
                prescriptionImage(),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: AppButton(
                      text: 'ADD Branch',
                      color: AppColors.backgroundcolori,
                      primaryColor: AppColors.color1,
                      onPressed: () {
                        viewModel.addBranch();
                        // if (_formKey.currentState!.validate()) {
                        //   viewModel.addDoctor(context,
                        //       createdBy: "test",
                        //       emailId: _emailIdController.text,
                        //       mobileNo: _mobileNumberController.text,
                        //       name: _nameOfTheDoctorController.text,
                        //       doctorRegistrationNumber:
                        //           _doctorRegistrationNumberController.text);
                        //    context.go(RoutesList.addDoctorSuccessfully);
                        // }
                      }),
                ),
              ]),
        ),
      ),
    );
  }

  SizedBox _sizedBox({double? height}) {
    return SizedBox(
      height: height,
    );
  }

  Widget prescriptionImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Upload Prescription",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _sizedBox(height: 10),
          ImageSclectionScreen(),
          //Container()
        ]),
      ),
    );
  }

  Widget selectSpecilization(GetAllHospitalViewModel viewModel) {
    return Container(
      child: MultiSelectContainer(
          itemsDecoration: MultiSelectDecorations(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.app_bg_color,
                  AppColors.backgroundcolor
                ]),
                border: Border.all(color: Colors.green[200]!),
                borderRadius: BorderRadius.circular(5)),
            selectedDecoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  AppColors.app_bg_color,
                  AppColors.backgroundcolor
                ]),
                border: Border.all(color: Colors.green[700]!),
                borderRadius: BorderRadius.circular(5)),
            disabledDecoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey[500]!),
                borderRadius: BorderRadius.circular(5)),
          ),
          prefix: MultiSelectPrefix(
              selectedPrefix: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              disabledPrefix: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.do_disturb_alt_sharp,
                  size: 14,
                ),
              )),
          items: viewModel.specilityList!
              .map((e) => MultiSelectCard(value: e.id, label: e.specialityName))
              .toList(),
          onChange: (allSelectedItems, selectedItem) {}),
    );
  }
}

/*

{
  "address": "string",
  "created_by": "string",
  "hospital_id": "string",
  "hospital_reg_number": "string",
  "name": "string",
  "prescription_image_url": "string",
  "specialization_ids": [
    {
      "id": "string"
    }
  ]
}

 */
