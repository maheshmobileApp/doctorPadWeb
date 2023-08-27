import 'package:cgg_base_project/view/reports/reposts_view.dart';

import '../../responsive.dart';
import '../../view_model/doctor_view_model.dart';
import '../../view_model/hospital_viewmodel.dart';
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
                  viewModel.selectedMenum == DashBoardMenuOptions.REPORTS
                      ? SizedBox()
                      : Container(
                          height: 100, child: headerWidget(viewModel, context)),
                  Expanded(
                    child: Container(
                      child: loadWidgets(viewModel, context),
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
      case DashBoardMenuOptions.DOCTORSPECALITIES:
        button_title = "Add Specialities ";
        header_title = "Doctor Specialities ";
        break;
      case DashBoardMenuOptions.hOSPITALSPECALITIES:
        button_title = "Add Specialities ";
        header_title = "Hospital Specialities ";
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
          case DashBoardMenuOptions.DOCTORSPECALITIES:
            showSpeciality(context);
            break;
          case DashBoardMenuOptions.hOSPITALSPECALITIES:
            showSpeciality(context);
            break;
          default:
        }
      },
    );
  }

  showAddDoctor(BuildContext context) {
    Provider.of<GetAllDoctorViewModel>(context, listen: false)
        .setEmptyDetails();
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
    Provider.of<GetAllHospitalViewModel>(context, listen: false)
        .setEmptyDetails();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content:
                SizedBox(width: 500, height: 430, child: AddHospitalsForms()));
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

  Widget loadWidgets(DashBoardViewModel viewModel, BuildContext context) {
    switch (viewModel.selectedMenum) {
      case DashBoardMenuOptions.HOSPITALS:
        return HospitalView();
      case DashBoardMenuOptions.DOCTORS:
        Provider.of<GetAllDoctorViewModel>(context, listen: false)
            .isEditDoctor = true;
        return DoctorsWebView();
      case DashBoardMenuOptions.DOCTORSPECALITIES:
        return HospitalSpecialites();
      case DashBoardMenuOptions.hOSPITALSPECALITIES:
        return HospitalSpecialites();
      case DashBoardMenuOptions.REPORTS:
        return ReportsScreen();
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