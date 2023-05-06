// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cgg_base_project/res/app_colors.dart';
import 'package:cgg_base_project/res/components/logo_widget.dart';
import 'package:cgg_base_project/view_model/dashboard_view_model.dart';

class SidepanelWidgets extends StatelessWidget {
  const SidepanelWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 1080,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          LogoWidget(),
          Padding(
            padding: EdgeInsets.all(25),
          ),
          MenuItemWidget(
              title: "View Hospitals",
              icon: "assets/icons/home.png",
              options: DashBoardMenuOptions.HOSPITALS),
          SizedBox(height: 50),
          MenuItemWidget(
              title: "View Doctors",
              icon: "assets/images/view_doctor.png",
              options: DashBoardMenuOptions.DOCTORS),
          SizedBox(height: 50),
          MenuItemWidget(
              title: "Specialities",
              icon: "assets/images/view_doctor.png",
              options: DashBoardMenuOptions.SPECALITIES),
          SizedBox(height: 50),
          InkWell(
              onTap: () => context
                  .read<DashBoardViewModel>()
                  .selectTheSideMenu(DashBoardMenuOptions.SPECALITIES),
              child: Icon(
                Icons.logout_outlined,
                color: AppColors.color1,
                size: 40,
              )),
          SizedBox(height: 15),
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
    return Column(
      children: [
        GestureDetector(
          child: Image.asset(
            icon,
          ),
          onTap: () =>
              context.read<DashBoardViewModel>().selectTheSideMenu(options),
        ),
        SizedBox(height: 15),
        Text(
          title,
          textDirection: TextDirection.ltr,
          style: menuTitleStyle,
        ),
      ],
    );
  }
}

TextStyle menuTitleStyle = TextStyle(
    color: AppColors.color1,
    fontSize: 15,
    fontFamily: 'Muli',
    fontWeight: FontWeight.w700);
