import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/button_component.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/components/text_field/text_field.dart';
import '../../res/constants/routes_constants.dart';
class DoctorDetails extends StatelessWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
       SidepanelWidgets(),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                //height: MediaQuery.of(context).size.height - 100,
                width: 300,
                decoration: BoxDecoration(
                    color:Color.fromRGBO(15, 148, 220, 1), borderRadius: BorderRadius.circular(16)),
                // alignment: Alignment.topLeft,
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
                    AppButton(text:'Back',color: Color(0xff0093E9),
                        myEdgeInsets: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                        primaryColor:Color(0xffFFFFFF),
                        onPressed: () {
                          context.go(RoutesList.doctorWebView);
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
