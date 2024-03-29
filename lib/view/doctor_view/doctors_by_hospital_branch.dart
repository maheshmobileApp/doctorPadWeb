import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/small_button_widget.dart';
import '../../view_model/doctor_view_model.dart';

class DoctorsByAssignDoctorss extends StatefulWidget {
  const DoctorsByAssignDoctorss({super.key});
  @override
  State<DoctorsByAssignDoctorss> createState() =>
      _DoctorsByAssignDoctorssState();
}

class _DoctorsByAssignDoctorssState extends State<DoctorsByAssignDoctorss> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllDoctorViewModel>();
    return Scaffold(
      body: viewModel.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: (1 / .2),
                children: List.generate(viewModel.doctorsByBranch!.body!.length,
                    (index) {
                  final doctorData = viewModel.doctorsByBranch?.body![index];
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.color1, width: 3),
                          color: AppColors.backgroundcolor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
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
                      trailing: viewModel.isFromAssignDoctor
                          ? SmallButton(
                              onPressed: () {
                                print("view button clicked");
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
