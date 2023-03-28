import 'package:cgg_base_project/res/app_colors.dart';
import 'package:cgg_base_project/res/components/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes_constants.dart';
class SidepanelWidgets extends StatelessWidget {
  const SidepanelWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: 120,
      height: 1080,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          LogoWidget(),
          Padding(padding:EdgeInsets.all(25),),
          GestureDetector(
            child: Image.asset(
              'assets/icons/home.png',
            ),
            onTap: () => context.go(RoutesList.hospitalView),
          ),
          SizedBox(height: 5,),
          Text(
            'View Hospitals',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: AppColors.color1,fontSize: 10,fontFamily: 'Muli'),
          ),
          SizedBox(height: 30,width: 20,),
          GestureDetector(
            child: Image.asset(
              'assets/images/view_doctor.png',
            ),
            onTap: () => context.go(RoutesList.doctorWebView),
          ),
          SizedBox(height: 5,),
          Text(
            'View Doctor',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: AppColors.color1,fontSize: 10 ,fontFamily: 'Muli'),
          ),
          SizedBox(height: 180,),
          InkWell(
              onTap: () => context.go(RoutesList.loginWebView),
              child: Icon(Icons.logout_outlined, color:AppColors.color1, size: 40,)),
          SizedBox(height: 10,),
          Text('Logout', style: TextStyle(color:AppColors.color1,fontFamily: 'Muli'),),
        ],
      ),
      color: AppColors.backgroundcolori
    );
  }
}
