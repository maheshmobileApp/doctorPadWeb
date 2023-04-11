import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/search_textfield/search_textfield.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';
import '../../view_model/doctor_view_model.dart';
import '../../view_model/hospital_viewmodel.dart';

class HospitalDetails extends StatelessWidget {
  HospitalDetails({Key? key}) : super(key: key);
  TextEditingController _nameOfTheHospitalController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  TextEditingController _contactNumberController = TextEditingController();

  TextEditingController _emailIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
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
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width / 3,
                  // height: 500,
                  // width: 400,
                  padding: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundcolori,
                      borderRadius: BorderRadius.circular(16)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchTextfield(
                          controller: _nameOfTheHospitalController,
                          icon: Icons.home,
                          hintText: 'Name Of The Hospital',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name Of The Hospital';
                            }
                          },
                          keyboardType: TextInputType.name,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        SearchTextfield(
                          controller: _addressController,
                          icon: Icons.contact_phone_outlined,
                          hintText: 'Address',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name Of The Address';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        SearchTextfield(
                          controller: _contactNumberController,
                          icon: Icons.call,
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
                        Padding(padding: EdgeInsets.all(10)),
                        SearchTextfield(
                          controller: _emailIdController,
                          icon: Icons.email,
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
                        Padding(padding: EdgeInsets.all(25)),
                        AppButton(
                            text: 'ADD  HOSPITAL',
                            color: AppColors.backgroundcolori,
                            myEdgeInsets: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5),
                            primaryColor: AppColors.color1,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                viewModel.addHospital(
                                  context,
                                  _nameOfTheHospitalController.text,
                                  _addressController.text,
                                  _contactNumberController.text,
                                  _emailIdController.text,
                                );
                                //context.go(RoutesList.addHospitalSuccessfully);
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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   context.read<GetAllDoctorViewModel>().getAllDoctor();
  // }
