import '../../res/components/inputTextField.dart';
import '../../utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../view_model/doctor_view_model.dart';
import '../../view_model/hospital_viewmodel.dart';

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
    viewModel.specilityList =
        Provider.of<GetAllHospitalViewModel>(context, listen: false)
            .doctorspecilityList;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      SizedBox(height: 35, width: 75, child: Icon(Icons.close)),
                ),
              ),
              AppInputTextField(
                  title: 'Name Of The Doctor',
                  controller: _nameOfTheDoctorController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Name Of The Doctor';
                    }
                    return null;
                  },
                  hintText: "Enter Name Of The Doctor"),
              _sizedBox(height: 10),
              AppInputTextField(
                title: 'Doctor Registration Number',
                controller: _doctorRegistrationNumberController,
                // prefixIcon: Icon(MyFlutterApp.contact),
                hintText: 'Enter Doctor Registration Number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Doctor Registration Number';
                  } 
                },
                keyboardType: TextInputType.number,
              ),
              _sizedBox(height: 10),
              AppInputTextField(
                title: 'Mobile Number',
                controller: _mobileNumberController,
                //  prefixIcon: Icon(MyFlutterApp.call),
                hintText: "Enter Mobile Number",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Mobile number';
                  } else if (!phonenovalid(value)) {
                    return 'Enter Valid Mobile number';
                  }
                },
                keyboardType: TextInputType.number,
              ),
              _sizedBox(height: 10),
              Text("Select The Doctor Speciality",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              _sizedBox(height: 10),
              selectSpecilization(viewModel, 0),
              _sizedBox(height: 10),
              // Text("Select The Clinic Speciality",
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              // _sizedBox(height: 10),
              // selectSpecilization(viewModel, 1),
              _sizedBox(height: 10),
              AppInputTextField(
                title: 'Email id',
                controller: _emailIdController,
                //  prefixIcon: Icon(MyFlutterApp.message),
                hintText: 'Enter Email id',
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
              _sizedBox(height: 20),
              Center(
                child: AppButton(
                    text: 'ADD DOCTOR',
                    color: AppColors.backgroundcolori,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _sizedBox({double? height}) {
    return SizedBox(
      height: height,
    );
  }

  Widget selectSpecilization(GetAllDoctorViewModel viewModel, int type) {
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
                if (type == 1) {
                  //Clinic specilaty
                  viewModel.selectedHospitalSpecility = allSelectedItems;
                } else {
                  //Doctor
                  viewModel.selectedDoctorSpecility = allSelectedItems;
                }
                // viewModel.selectedSpecility = allSelectedItems;
              }),
        ),
      ],
    );
  }
}
