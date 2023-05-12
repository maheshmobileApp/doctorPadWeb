import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import 'package:cgg_base_project/res/app_colors.dart';
import 'package:cgg_base_project/res/components/sidepanel_widgets/sidepanel_widgets.dart';
import 'package:cgg_base_project/res/components/small_button_widget.dart';
import 'package:cgg_base_project/view/add_branch/add_branch_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/constants/routes_constants.dart';
import '../../view_model/hospital_viewmodel.dart';

class HospitalView extends StatefulWidget {
  HospitalView({super.key});

  @override
  State<HospitalView> createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    return Scaffold(
      drawer: SidepanelWidgets(),
      body: viewModel.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: GridView.builder(
                itemCount: viewModel.hospitals?.body?.length,
                itemBuilder: (context, index) {
                  final hospitalData = viewModel.hospitals?.body![index];
                  return hospitalListCard(
                    hospitalData: hospitalData,
                    onPressed: () {
                      viewModel.selectedHospital = hospitalData;
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 10),
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    // context.read<GetAllHospitalViewModel>().getAllHospitals();
  }
}

class hospitalListCard extends StatelessWidget {
  hospitalListCard({super.key, required this.hospitalData, this.onPressed});

  final HospitalResponseModel? hospitalData;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.color1, width: 3),
                // color: AppColors.backgroundcolor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                // child: Image.asset(
                //   'assets/images/hospital_icon.jpg',
                //   color: AppColors.color1,
                // ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RowWithTitleAndDetials(
                title: "Name:  ", value: hospitalData?.name ?? ""),
            RowWithTitleAndDetials(
                title: "Email: ", value: hospitalData?.email ?? ""),
            RowWithTitleAndDetials(
                title: "Phone Number:  ", value: hospitalData?.phone ?? ""),
            RowWithTitleAndDetials(title: "Address: ", value: ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallButton(
                  onPressed: () {
                    print("view button clicked");
                  },
                  title: 'View',
                ),
                SmallButton(
                  onPressed: () {
                    onPressed!();
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                            content: SizedBox(
                                width: 550,
                                height: 600,
                                child: AddBranchData()));
                      },
                    );
                  },
                  title: 'Add Branch',
                )
              ],
            )
          ],
        ));
  }
}

class RowWithButtons extends StatelessWidget {
  const RowWithButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RowWithTitleAndDetials extends StatelessWidget {
  const RowWithTitleAndDetials(
      {super.key, required this.title, required this.value});
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title ?? "",
            style: TextStyle(
                fontFamily: 'Muli', fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value ?? "",
            style: TextStyle(
                fontFamily: 'Muli', fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

/*
 ListTile(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.color1, width: 3),
            color: AppColors.backgroundcolor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Image.asset(
              'assets/images/hospital_logo.png',
              color: AppColors.color1,
            ),
          ),
        ),
        title: Text(
          hospitalData?.name ?? "",
          style: TextStyle(fontFamily: 'Muli', fontSize: 12),
        ),
        subtitle: Text(
          hospitalData?.email ?? "",
          style: TextStyle(fontFamily: 'Muli', fontSize: 12),
        ),
        //trailing: const Icon(Icons.add_a_photo),
      ),

 */
