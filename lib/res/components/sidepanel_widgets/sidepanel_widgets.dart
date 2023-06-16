// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/hospital_viewmodel.dart';
import '../../app_colors.dart';
import '../logo_widget.dart';
import '../../../view_model/dashboard_view_model.dart';
import '../../../view_model/doctor_view_model.dart';

class SidepanelWidgets extends StatelessWidget {
  const SidepanelWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      //  height: 1080,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView(
        children: [
          LogoWidget(),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          MenuItemWidget(
              title: "View Hospitals",
              icon: "assets/icons/home.png",
              options: DashBoardMenuOptions.HOSPITALS),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          MenuItemWidget(
              title: "View Doctors",
              icon: "assets/images/view_doctor.png",
              options: DashBoardMenuOptions.DOCTORS),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          MenuItemWidget(
            title: "Hospital Specialities",
            icon: "assets/images/view_doctor.png",
            options: DashBoardMenuOptions.hOSPITALSPECALITIES,
          ),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          MenuItemWidget(
            title: "Doctor Specialities",
            icon: "assets/images/view_doctor.png",
            options: DashBoardMenuOptions.DOCTORSPECALITIES,
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                InkWell(
                    onTap: () => context
                        .read<DashBoardViewModel>()
                        .selectTheSideMenu(
                            DashBoardMenuOptions.hOSPITALSPECALITIES),
                    child: Icon(
                      Icons.logout_outlined,
                      color: AppColors.color1,
                      size: 40,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Logout',
                  style: menuTitleStyle,
                ),
              ],
            ),
          ),
          // SizedBox(height: 15),
        ],
      ),
      // color: AppColors.backgroundcolor
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [AppColors.color10, AppColors.backgroundcolor])),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.options,
  }) : super(key: key);
  final String title;
  final String icon;
  final DashBoardMenuOptions options;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DashBoardViewModel>();
    return InkWell(
      onTap: () {
        Provider.of<GetAllDoctorViewModel>(context, listen: false)
            .isFromAssignDoctor = false;
        context.read<DashBoardViewModel>().selectTheSideMenu(options);
        context.read<GetAllHospitalViewModel>().selectedSpecilty = options;
        context.read<GetAllHospitalViewModel>().getSpecilitiesList();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: selectedColor(viewModel, options)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 55,
                width: 55,
                child: Image.asset(
                  icon,
                ),
              ),
              SizedBox(height: 15),
              Text(
                title,
                textDirection: TextDirection.ltr,
                style: menuTitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectedColor(
      DashBoardViewModel selectedOption, DashBoardMenuOptions options) {
    if (selectedOption.selectedMenum == options) {
      return Color.fromARGB(255, 57, 175, 234);
    } else {
      return null;
    }
  }
}

TextStyle menuTitleStyle = TextStyle(
    color: AppColors.color1,
    fontSize: 15,
    fontFamily: 'Muli',
    fontWeight: FontWeight.w700);
