import 'package:flutter/material.dart';
import '../../res/components/text_field/text_field.dart';
import '../doctor_web_view/doctor_web_view.dart';
import '../hospital_web_view/hospital_web_view.dart';

class HospitalWebDetails extends StatelessWidget {
  const HospitalWebDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 150,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Image.asset('assets/doctpad.png'),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HospitalView()));
                },
                child: Image.asset('assets/view_hospital.png'),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorWebView()));
                },
                child: Image.asset('assets/view_doctor.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'View Doctors',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 200,
              ),
              Icon(
                Icons.logout_outlined,
                color: Colors.white,
                size: 40,
              )
            ],
          ),
          color: Color.fromRGBO(15, 148, 220, 1),
        ),
        Column(
          children: [
            Container(
              height: 100,
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
                  Padding(padding: EdgeInsets.all(80)),
                  Image.asset('assets/search2.png'),
                  Padding(padding: EdgeInsets.all(50)),
                  Image.asset('assets/user2.png'),
                  Padding(padding: EdgeInsets.all(5)),
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
              width: 500,
              color: Color.fromRGBO(15, 148, 220, 1),
              child: Column(
                children: [
                  TextFeild(
                    icon: Icons.home,
                    hintText: 'Name Of The Hospital',
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFeild(
                    icon: Icons.lock,
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ADD Doctor To HOSPITAL',
                      style: TextStyle(color: Color(0xff0093E9)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color(0xffFFFFFF),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
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
