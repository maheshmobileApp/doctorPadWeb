import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/button_component.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class DoctorAddDetails extends StatelessWidget {
  const DoctorAddDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width - 150,
                alignment: Alignment.topLeft,
                color: Color.fromRGBO(19, 151, 219, 0.06),
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Text('Add Doctors', style: TextStyle(fontSize: 25),),
                    Padding(padding:EdgeInsets.only(left: 100,right:550,top: 10 ,bottom: 10)),
                    Image.asset('assets/search2.png'),
                    SizedBox(height: 20,width: 20,),
                    Image.asset('assets/user2.png'),
                    SizedBox(height: 20,width: 5,),
                    Text('User Name', style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 550,
              width: 450,
              decoration: BoxDecoration(
                  color:Color.fromRGBO(15, 148, 220, 1), borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  TextFeild(
                    icon: Icons.home,
                    hintText: 'Name Of The Doctor',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFeild(
                    icon: Icons.lock,
                    hintText: 'Doctor Registration Number',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFeild(
                    icon: Icons.call,
                    hintText: "Mobile Number",
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFeild(
                    icon: Icons.lock,
                    hintText: 'Doctor Speciality',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFeild(
                    icon: Icons.lock,
                    hintText: 'Clinic Speciality',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFeild(
                    icon: Icons.email,
                    hintText: 'Email id',
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                AppButton(text:'BULK UPLOAD',color:Color(0xff11193C),
                    myEdgeInsets: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    primaryColor:  Color(0xff1397DB0F),
                    onPressed: () {
                     // context.go(RoutesList.hospitalDetails);
                    }
                ),
                  Padding(padding: EdgeInsets.all(8)),
                  AppButton(text:'ADD DOCTOR',color:Color(0xff0093E9),
                      myEdgeInsets: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                      primaryColor: Color(0xffFFFFFF),
                      onPressed: () {
                    context.go(RoutesList.addDoctorSuccessfully);
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
