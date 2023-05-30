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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Branch Name';
                    }
                    return null;
                  },
                ),
                _sizedBox(height: 10),
                AppInputTextField(
                  controller: _branchAddressControl,
                  hintText: "Enter Branch Address",
                  title: "Branch Address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Branch Address';
                    }
                    return null;
                  },
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
                        if (_formKey.currentState!.validate()) {
                          viewModel.addBranch(
                              context: context,
                              branName: _branchNameControl.text,
                              branchAddress: _branchAddressControl.text);
                        }
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
    return Column(
      children: [
        Container(
          child: MultiSelectContainer(
              itemsDecoration: MultiSelectDecorations(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                selectedDecoration: BoxDecoration(
                    color: AppColors.app_bg_color,
                    borderRadius: BorderRadius.circular(5)),
                disabledDecoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
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
              ),
              textStyles: MultiSelectTextStyles(
                  disabledTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                  selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14)),
              items: viewModel.specilityList!
                  .map((e) =>
                      MultiSelectCard(value: e.id, label: e.specialityName))
                  .toList(),
              onChange: (allSelectedItems, selectedItem) {
                viewModel.selectedSpecility = allSelectedItems;
              }),
        ),

      ],
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
