import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../model/hospital_details/branches_list_model.dart';
import '../../model/hospital_details/get_all_hospital.dart';
import '../../res/app_colors.dart';
import '../../res/components/small_button_widget.dart';
import '../../view_model/doctor_view_model.dart';
import '../../view_model/hospital_viewmodel.dart';
import '../doctor_view/doctor_view.dart';
import 'hospital_view.dart';
import 'dart:html' as html;

class HospitalBranchesList extends StatelessWidget {
  HospitalBranchesList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: viewModel.bracnhesList.length,
          itemBuilder: (context, index) {
            final branchData = viewModel.bracnhesList[index];
            return BranchListCard(
              hospitalData: branchData,
              viewDoctors: () async {
                //DoctorsWebView
                final doctorsGetStatus =
                    await Provider.of<GetAllDoctorViewModel>(context,
                            listen: false)
                        .getAllDoctorByBranch(branchData?.id ?? "");
                // final hospitalModel = context.watch<GetAllDoctorViewModel>();
                // await hospitalModel.getAllDoctorByBranch(branchData?.id ?? "");
                if (doctorsGetStatus == true) {
                  showDialog(
                    context: context,
                    // barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                          content: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 600,
                              child: DoctorsWebView()));
                    },
                  );
                } else {
                  noDoctorsAlert(context);
                }
              },
              assignDoctors: () async {
                final size = MediaQuery.of(context).size;
                Provider.of<GetAllDoctorViewModel>(context, listen: false)
                    .selectedBranchID = branchData?.id ?? "";
                Provider.of<GetAllDoctorViewModel>(context, listen: false)
                    .isFromAssignDoctor = true;
                Provider.of<GetAllDoctorViewModel>(context, listen: false)
                    .isFromViewDoctorsByBranch = false;
                Provider.of<GetAllDoctorViewModel>(context, listen: false)
                    .isEditDoctor = false;
                await Provider.of<GetAllDoctorViewModel>(context, listen: false)
                    .getAllDoctor();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                          // width: size.width - 200,
                          // height: size.height - 300,
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // viewModel.isFromAssignDoctor = false;
                              },
                              child: SizedBox(
                                  height: 35,
                                  width: 75,
                                  child: Icon(Icons.close)),
                            ),
                          ),
                          Container(
                              width: size.width - 200,
                              height: size.height - 300,
                              child: DoctorsWebView()),
                        ],
                      )),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  noDoctorsAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"))
        ], content: SizedBox(child: Text("No Doctors Available")));
      },
    );
  }
}

class BranchListCard extends StatelessWidget {
  BranchListCard(
      {super.key,
      required this.hospitalData,
      this.assignDoctors,
      this.viewDoctors});

  final BrachDetailsModel? hospitalData;
  void Function()? assignDoctors;
  void Function()? viewDoctors;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: AppColors.color1, width: 3),
                //   ),
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                RowWithTitleAndDetials(
                    title: "Branch Name:  ", value: hospitalData?.name ?? ""),
                RowWithTitleAndDetials(
                    title: "Branch Address: ",
                    value: hospitalData?.address ?? ""),
              ],
            ),
            //specilityWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    html.window.open(
                        hospitalData?.prescriptionImageUrl ?? "", "_blank");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          // border: Border.all(widt),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.backgroundcolor),
                      height: 55,
                      width: 300,
                      child: Text(
                        "View Prescription Image",
                        style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButton(
                  onPressed: () {
                    viewDoctors!();
                    print("view button clicked");
                  },
                  title: 'View Doctors',
                ),
                SmallButton(
                  onPressed: () {
                    assignDoctors!();
                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //         content: SizedBox(
                    //             width: 550, height: 600, child: Container()));
                    //   },
                    // );
                  },
                  title: 'Assign Doctors',
                )
              ],
            )
          ],
        ));
  }

  Widget specilityWidget(BrachDetailsModel? branchData) {
    return Column();
  }

  Widget prescriptionImage(BrachDetailsModel? branchData) {
    print("image url ${hospitalData?.prescriptionImageUrl}");
    return Container(
      height: 100,
      width: 200,
      child: Image.network(
          "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
    );
  }
}
