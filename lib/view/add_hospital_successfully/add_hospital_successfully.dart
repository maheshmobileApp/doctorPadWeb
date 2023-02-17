import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/button_component.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';
class AddHospitalSuccessfully extends StatelessWidget {
  const AddHospitalSuccessfully({Key? key}) : super(key: key);
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
                    'Add Doctors',
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
              height: 500,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/successfully.png'),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Add Hospital Successfully',
                    style: TextStyle(fontSize: 25, color: Color(0xff1397DB)),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  AppButton(text:'Back',color: Color(0xffFFFFFF),
                      myEdgeInsets: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                      primaryColor: Color(0xff1397DB),
                      onPressed: () {
                        context.go(RoutesList.hospitalView);
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
