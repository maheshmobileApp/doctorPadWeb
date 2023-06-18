import '../../model/hospital_details/get_all_hospital.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/components/small_button_widget.dart';
import '../add_branch/add_branch_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      drawer: SidepanelWidgets(),
      body: viewModel.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : viewModel.hospitals?.message == "no hospital found"
              ? Center(
                  child: Text('No Hospitals'),
                )
              : Container(
                  child: ListView(
                      //itemCount: viewModel.hospitals?.body?.length,

                      children: viewModel.hospitals!.body!.map((e) {
                    return hospitalListCard(
                      hospitalData: e,
                      viewBraches: () async {
                        final branches = await viewModel
                            .getBranchesByHospitalsId(e.id ?? "");
                        if (branches) {
                          viewBranches(context);
                        } else {
                          noBranchAlert(context);
                        }
                        // if (value) {
                        //   viewBranches(context, viewModel.bracnhesList);
                        // } else {
                        //   noBranchAlert(context);
                        // }
                      },
                      onPressed: () {
                        viewModel.selectedHospital = e;
                      },
                    );
                  }).toList()
                      //  viewModel.hospitals?.body!.map((e) {
                      //  })

                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 5,
                      //     crossAxisSpacing: 4.0,
                      //     mainAxisSpacing: 10),
                      ),
                ),
    );
  }

  noBranchAlert(BuildContext context) {
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
        ], content: Text("No branches found for this hospital"));
      },
    );
  }

  viewBranches(BuildContext context) {
    context.go(RoutesList.viewBranches);
    /* final size = MediaQuery.of(context).size;
    print("logs branches $bracnhesList");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(
                width: size.width - 200,
                height: size.height - 200,
                child: HospitalBranchesList(
                )));
      },
    );*/
  }

  @override
  void initState() {
    super.initState();
    // context.read<GetAllHospitalViewModel>().getAllHospitals();
  }
}

class hospitalListCard extends StatelessWidget {
  hospitalListCard(
      {super.key,
      required this.hospitalData,
      this.onPressed,
      this.viewBraches});

  final HospitalResponseModel? hospitalData;
  void Function()? onPressed;
  void Function()? viewBraches;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowWithTitleAndDetials(
                      title: "Name:  ", value: hospitalData?.name ?? ""),
                  RowWithTitleAndDetials(
                      title: "Email: ", value: hospitalData?.email ?? ""),
                  RowWithTitleAndDetials(
                      title: "Phone Number:  ",
                      value: hospitalData?.phone ?? ""),
                  //RowWithTitleAndDetials(title: "Address: ", value: ""),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallButton(
                    onPressed: () {
                      viewBraches!();
                      print("view button clicked");
                    },
                    title: 'View Branches',
                  ),
                  SizedBox(
                    height: 30,
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
          ),
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
                fontFamily: 'Muli', fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value ?? "",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontFamily: 'Muli', fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

/*

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
            // SizedBox(
            //   height: 30,
            // ),
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
