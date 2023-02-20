import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/routes_constants.dart';
import '../button_component.dart';
class OptionWidgets extends StatelessWidget {
    OptionWidgets({Key? key,this.text,this.title,this.appButton,this.routes,required this.isAcceptTermsAndConditions,required this.onTap} ) : super(key:key);
  final String? text;
  final String? title;
  final AppButton? appButton;
  final  RoutesList? routes;
  bool isAcceptTermsAndConditions = false;
    final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

    return Container(
      height:75,
      width: MediaQuery.of(context).size.width -120,
      alignment: Alignment.topLeft,
      color: AppColors.color9,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Text( text??'Hospitals View', style: TextStyle(fontSize: 25),),
         Padding(padding:EdgeInsets.only(left: 100,right:550,top: 10 ,bottom: 10)),
          // TextField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'User Name',
          //     hintText: 'Enter Your Name',
          //   ),
          // ),
          //  TextField(
         //    decoration: InputDecoration(
         //      contentPadding: EdgeInsets.all(5),
         //      icon: Icon(Icons.search),
         //      filled: true,
         //      fillColor: Colors.blueAccent,
         //      border: OutlineInputBorder(
         //          borderSide: BorderSide.none,
         //          borderRadius: BorderRadius.circular(50)
         //      ),
         //    ),
         //  ),
          Image.asset('assets/search2.png'),
        if (isAcceptTermsAndConditions)...{
            AppButton(
            text:title??'+ Add Hospital',
              myEdgeInsets: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              borderRadius: BorderRadius.circular(3),
              onPressed: () {
                this.onTap();
                }

          )},
          SizedBox(height: 20,width: 20,),
          Image.asset('assets/user2.png',),
          SizedBox(height: 20,width: 5,),
          Text('User Name', style: TextStyle(color:  AppColors.color5,),
          ),
        ],
      ),
    );
  }
}
