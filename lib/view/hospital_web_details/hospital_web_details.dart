import 'package:cgg_base_project/res/components/button_component.dart';
import 'package:cgg_base_project/res/components/sidepanel_widgets/sidepanel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class HospitalWebDetails extends StatelessWidget {
  const HospitalWebDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width - 150,
              alignment: Alignment.topLeft,
              color: Color.fromRGBO(19, 151, 219, 0.06),
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Text(
                    'Add Hospitals',
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(padding:EdgeInsets.only(left: 100,right:550,top: 10 ,bottom: 10)),
                  Image.asset('assets/search2.png'),
                  SizedBox(height: 20,width: 20,),
                  Image.asset('assets/user2.png'),
                  SizedBox(height: 20,width: 5,),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 480,
              width: 400,
              decoration: BoxDecoration(
                  color:Color.fromRGBO(15, 148, 220, 1), borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  TextFeild(
                    icon:Icons.person,
                    hintText: 'Name Of The Hospital',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.contact_phone_outlined,
                    hintText: 'Address',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.call,
                    hintText: "Contact Number",
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.email,
                    hintText: 'Email id',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  AppButton(text:'ADD Doctor To HOSPITAL',color: Color(0xff000000),
                      myEdgeInsets: EdgeInsets.symmetric(horizontal:20,vertical:10),
                      borderRadius: BorderRadius.circular(2),
                      primaryColor: Color(0xffB8DAD2),
                      onPressed: () {
                  //  context.go(RoutesList.hospitalDetails);
                  }
                  ),
                  Padding(padding:EdgeInsets.all(10)),
                  AppButton(text:'Back',color: Color(0xff0F94DC),
                      myEdgeInsets: EdgeInsets.symmetric(horizontal:40,vertical:10),
                      primaryColor: Colors.white,
                      onPressed: () {
                        context.go(RoutesList.hospitalWebDetails);
                      }
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
