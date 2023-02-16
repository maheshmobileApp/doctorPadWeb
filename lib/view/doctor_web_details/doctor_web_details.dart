import 'package:cgg_base_project/view/add_doctor_successfully/add_doctor_successfully.dart';
import 'package:flutter/material.dart';
import '../../res/components/text_field/text_field.dart';
import '../doctor_web_view/doctor_web_view.dart';
import '../hospital_web_view/hospital_web_view.dart';
class DoctorAddDetails extends StatelessWidget {
  const DoctorAddDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 120,
          height: 1080,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Image.asset('assets/doctpad.png'),
              Padding(padding:EdgeInsets.all(25),),
              GestureDetector(
                child: Image.asset(
                  'assets/icons/home.png',
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalView()));
                },
              ),
              SizedBox(height: 5,),
              Text(
                'View Hospitals',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white,fontSize: 10),
              ),
              SizedBox(height: 30,width: 20,),
              GestureDetector(
                child: Image.asset(
                  'assets/view_doctor.png',
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorWebView()));
                },
              ),
              SizedBox(height: 5,),
              Text(
                'View Doctor',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white,fontSize: 10 ),
              ),
              SizedBox(height: 180,),
              Icon(Icons.logout_outlined, color: Colors.white, size: 40,),
              SizedBox(height: 10,),
              Text('Logout', style: TextStyle(color: Colors.white),),

            ],
          ),
          color: Color.fromRGBO(15, 148, 220, 1),
        ),
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'BULK UPLOAD',
                      style: TextStyle(
                        color: Color(0xff11193C),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color(0xff1397DB0F),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      textStyle: TextStyle(
                          // fontSize: 20,
                          ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddDoctorSuccessfully()));
                    },
                    child: Text(
                      'ADD DOCTOR',
                      style: TextStyle(color: Color(0xff0093E9)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color(0xffFFFFFF),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(),
                    ),
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
