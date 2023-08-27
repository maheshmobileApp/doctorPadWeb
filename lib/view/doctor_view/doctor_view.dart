import 'package:cgg_base_project/model/get_all_doctor.dart';
import 'package:cgg_base_project/view/doctor_details/doctor_details.dart';
import 'package:cgg_base_project/view/doctor_view/doctor_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/small_button_widget.dart';
import '../../view_model/doctor_view_model.dart';
import '../add_doctor/add_doctor.dart';

class DoctorsWebView extends StatefulWidget {
  const DoctorsWebView({super.key});
  @override
  State<DoctorsWebView> createState() => _DoctorsWebViewState();
}

class _DoctorsWebViewState extends State<DoctorsWebView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllDoctorViewModel>();
    final doctors = viewModel.isFromViewDoctorsByBranch
        ? viewModel.doctorsByBranch
        : viewModel.doctors;
    return Scaffold(
      body: viewModel.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : viewModel.doctors?.message == "no doctor found"
              ? Center(
                  child: Text('No Doctors'),
                )
              : Container(
                  child: ListView(
                    // crossAxisCount: 4,
                    // childAspectRatio: 3.3,
                    children: List.generate(doctors!.body!.length, (index) {
                      final doctorData = doctors.body![index];
                      return Card(
                        elevation: 4,
                        child: ListTile(
                         
                          onTap: () {
                            showDoctorDetailsView(doctorData);
                          },
                          leading: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.color1, width: 3),
                              color: AppColors.backgroundcolor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 15),
                              child: Image.asset(
                                'assets/images/doctor.png',
                                color: AppColors.color1,
                              ),
                            ),
                          ),
                          title: Text(
                            doctorData?.name ?? "",
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            doctorData?.emailId ?? "",
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: viewModel.isEditDoctor
                              ? SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: IconButton(
                                      onPressed: () {
                                        // Provider.of<GetAllHospitalViewModel>(context,
                                        //         listen: false)
                                        //     .setEditSpecility(specilities!);
                                        // showSpeciality(context);
                                        editDoctor(context, doctorData);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: AppColors.app_bg_color,
                                      )))
                              : viewModel.isFromAssignDoctor
                                  ? SmallButton(
                                      onPressed: () async {
                                        print("view button clicked");
                                        final result = await viewModel
                                            .assignDoctorsToBranch(
                                                doctorData?.id ?? "");
                                        if (result) {
                                          alrtForDoctorAssign(context);
                                        } else {
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      title: 'Assign',
                                    )
                                  : SizedBox(),
                          //trailing: const Icon(Icons.add_a_photo),
                        ),
                      );
                    }),
                  ),
                ),
    );
  }

  editDoctor(BuildContext context, DcotorsDetails doctorData) {
    Provider.of<GetAllDoctorViewModel>(context, listen: false)
        .setDoctorDetails(doctorData);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(width: 500, height: 650, child: AddDoctorForm()));
      },
    );
  }

  showDoctorDetailsView(DcotorsDetails? doctorData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(
                width: 400,
                height: 250,
                child: DoctorDetailsView(
                  doctorData: doctorData,
                )));
      },
    );
  }

  alrtForDoctorAssign(BuildContext context) {
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
        ], content: SizedBox(child: Text("Doctor Assigned succefully")));
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
