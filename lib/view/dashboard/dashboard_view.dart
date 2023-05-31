import '../../responsive.dart';
import '../add_hospital/add_hospital.dart';
import '../hospital_speciatiles.dart/add_specilites.dart';
import '../hospital_speciatiles.dart/hospital_specialites.dart';
import '../hospital_view/hospital_view.dart';
import '../../view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../add_doctor/add_doctor.dart';
import '../doctor_view/doctor_view.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DashBoardViewModel>();
    return Responsive(
        mobile: Container(
          color: Colors.red,
        ),
        desktop: Scaffold(
          body: Row(
            children: [
              Container(
                width: 200,
                child: SidepanelWidgets(),
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                      height: 100, child: headerWidget(viewModel, context)),
                  Expanded(
                    child: Container(
                      child: loadWidgets(viewModel),
                    ),
                  )
                  //HospitalView()
                ],
              ))
            ],
          ),
        ));
  }

  Widget headerWidget(DashBoardViewModel viewModel, BuildContext context) {
    var button_title = "";
    var header_title = "";
    switch (viewModel.selectedMenum) {
      case DashBoardMenuOptions.HOSPITALS:
        button_title = "Add Hospitals";
        header_title = "Hospitals";
        break;
      case DashBoardMenuOptions.DOCTORS:
        button_title = "Add Doctors";
        header_title = "Doctors";
        break;
      case DashBoardMenuOptions.SPECALITIES:
        button_title = "Add Specilities";
        header_title = "Specilities";
        break;
      default:
    }
    return HeadderWidget(
      title: button_title,
      text: header_title,
      onTap: () {
        switch (viewModel.selectedMenum) {
          case DashBoardMenuOptions.HOSPITALS:
            showAddHospital(context);
            break;
          case DashBoardMenuOptions.DOCTORS:
            showAddDoctor(context);
            break;
          case DashBoardMenuOptions.SPECALITIES:
            showSpeciality(context);
            break;
          default:
        }
      },
    );
  }

  showAddDoctor(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(width: 500, height: 650, child: AddDoctorForm()));
      },
    );
  }

  showAddHospital(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content:
                SizedBox(width: 500, height: 550, child: AddHospitalsForms()));
      },
    );
  }

  showSpeciality(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content:
                SizedBox(width: 350, height: 250, child: AddSpecilities()));
      },
    );
  }

  Widget loadWidgets(DashBoardViewModel viewModel) {
    switch (viewModel.selectedMenum) {
      case DashBoardMenuOptions.HOSPITALS:
        return HospitalView();
      case DashBoardMenuOptions.DOCTORS:
        return DoctorsWebView();
      case DashBoardMenuOptions.SPECALITIES:
        return HospitalSpecialites();
      default:
    }
    return Container();
  }
}
/*
 HeadderWidget(
                  text: "Hospitals View",
                  onTap: () {
                    context.go(RoutesList.hospitalDetails);
                  },
                ),
 */