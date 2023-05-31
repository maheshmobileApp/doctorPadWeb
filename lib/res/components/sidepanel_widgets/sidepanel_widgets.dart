// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Column(
        children: [
          LogoWidget(),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          MenuItemWidget(
              title: "View Hospitals",
              icon: "assets/icons/home.png",
              options: DashBoardMenuOptions.HOSPITALS),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          MenuItemWidget(
              title: "View Doctors",
              icon: "assets/images/view_doctor.png",
              options: DashBoardMenuOptions.DOCTORS),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          MenuItemWidget(
            title: "Specialities",
            icon: "assets/images/view_doctor.png",
            options: DashBoardMenuOptions.SPECALITIES,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          InkWell(
              onTap: () => context
                  .read<DashBoardViewModel>()
                  .selectTheSideMenu(DashBoardMenuOptions.SPECALITIES),
              child: Icon(
                Icons.logout_outlined,
                color: AppColors.color1,
                size: 40,
              )),
          // SizedBox(height: 15),
          Text(
            'Logout',
            style: menuTitleStyle,
          ),
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selectedColor(viewModel)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
                child: Image.asset(
                  icon,
                ),
                onTap: () {
                  Provider.of<GetAllDoctorViewModel>(context, listen: false)
                      .isFromAssignDoctor = false;
                  context.read<DashBoardViewModel>().selectTheSideMenu(options);
                }),
            SizedBox(height: 15),
            Text(
              title,
              textDirection: TextDirection.ltr,
              style: menuTitleStyle,
            ),
          ],
        ),
      ),
    );
  }

  selectedColor(DashBoardViewModel selectedOption) {
    if (selectedOption.selectedMenum == DashBoardMenuOptions.HOSPITALS) {
      return Colors.grey;
    } else if (selectedOption.selectedMenum == DashBoardMenuOptions.DOCTORS) {
      return Colors.grey;
    } else if (selectedOption.selectedMenum ==
        DashBoardMenuOptions.SPECALITIES) {
      return Colors.grey;
    } 

    switch (selectedOption.selectedMenum) {
      case DashBoardMenuOptions.HOSPITALS:
        return Colors.grey;
      case DashBoardMenuOptions.DOCTORS:
        return Colors.grey;
      case DashBoardMenuOptions.SPECALITIES:
        return Colors.grey;
      default:
    }
    return null;
  }
}

TextStyle menuTitleStyle = TextStyle(
    color: AppColors.color1,
    fontSize: 15,
    fontFamily: 'Muli',
    fontWeight: FontWeight.w700);
